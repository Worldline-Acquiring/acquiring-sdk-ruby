require 'concurrent'
require 'worldline/acquiring/sdk/authentication/authenticator'
require 'worldline/acquiring/sdk/authentication/oauth2_exception'
require 'worldline/acquiring/sdk/communication/default_connection'
require 'worldline/acquiring/sdk/communication/request_header'

module Worldline
  module Acquiring
    module SDK
      module Authentication
        # Authenticates requests made to the Worldline Acquiring platform using OAuth2.
        class OAuth2Authenticator < Authenticator

          private

          class TokenType

            def initialize(path, scopes)
              @path = path
              @scopes = scopes.join(' ')
            end

            attr_reader :path
            attr_reader :scopes
          end

          class AccessToken

            def initialize(token, expiration)
              @token = token
              @expiration = expiration
            end

            attr_reader :token
            attr_reader :expiration
          end

          # Only a limited amount of scopes may be sent in one request.
          # While at the moment all scopes fit in one request, keep this code so we can easily add more token types if necessary.
          # The empty path will ensure that all paths will match, as each full path ends with an empty string.
          TOKEN_TYPES = [
            TokenType.new('', [
              'processing_payment', 'processing_refund', 'processing_credittransfer', 'processing_accountverification',
              'processing_operation_reverse', 'processing_dcc_rate', 'services_ping'
            ]),
          ]

          public

          # Constructs a new OAuth2Authenticator instance using the provided CommunicatorConfiguration.
          #
          # @param communicator_configuration [Worldline::Acquiring::SDK::CommunicatorConfiguration] The configuration object
          #                                   containing the OAuth2 client id, client secret and token URI,
          #                                   connection timeout, and socket timeout. None of these can be _nil_ or empty,
          #                                   and the timeout values must be positive.
          def initialize(communicator_configuration)
            raise ArgumentError unless communicator_configuration.oauth2_client_id and not communicator_configuration.oauth2_client_id.strip.empty?
            raise ArgumentError unless communicator_configuration.oauth2_client_secret and not communicator_configuration.oauth2_client_secret.strip.empty?
            raise ArgumentError unless communicator_configuration.oauth2_token_uri and not communicator_configuration.oauth2_token_uri.strip.empty?
            raise ArgumentError unless communicator_configuration.connect_timeout > 0
            raise ArgumentError unless communicator_configuration.socket_timeout > 0

            @access_tokens = Concurrent::Map.new
            @client_id = communicator_configuration.oauth2_client_id
            @client_secret = communicator_configuration.oauth2_client_secret
            @token_uri = communicator_configuration.oauth2_token_uri
            @connect_timeout = communicator_configuration.connect_timeout
            @socket_timeout = communicator_configuration.socket_timeout
            @proxy_configuration = communicator_configuration.proxy_configuration
          end

          # @param http_method     [String, nil] 'GET', 'PUT', 'POST' or 'DELETE' indicating which HTTP method will be used with the request
          # @param resource_uri    [URI::HTTP, nil] URI object that includes #path and #query of the URL that will be used, #query may be *nil*
          # @param request_headers [Array<Worldline::Acquiring::SDK::Communication::RequestHeader>, nil] all headers used by the request
          def get_authorization(http_method, resource_uri, request_headers)
            token_type = get_token_type(resource_uri&.path)
            access_token = @access_tokens.compute(token_type.path) { |existing_token| get_valid_access_token(existing_token, token_type) }
            "Bearer #{access_token.token}"
          end

          private

          def get_token_type(full_path)
            TOKEN_TYPES.each do |token_type|
              if full_path&.end_with? token_type.path || full_path&.include?("#{token_type.path}/")
                return token_type
              end
            end
            raise ArgumentError.new("scope could not be found for path '#{full_path}'")
          end

          def get_valid_access_token(existing_token, token_type)
            if is_token_invalid(existing_token)
              return get_access_token(token_type)
            end
            existing_token
          end

          def is_token_invalid(access_token)
            not access_token or access_token.expiration < Time.now
          end

          def get_access_token(token_type)
            request_headers = [RequestHeader.new('Content-Type', 'application/x-www-form-urlencoded')]
            request_body = "grant_type=client_credentials&client_id=#{@client_id}&client_secret=#{@client_secret}&scope=#{token_type.scopes}"

            start_time = Time.now

            new_connection do |connection|
              response_status_code, access_token_response = nil
              connection.post(@token_uri, request_headers, request_body) do |status_code, _, content|
                response_status_code = status_code
                response_body = content.read.force_encoding('UTF-8')
                access_token_response = ::JSON.load(response_body)
              end

              if response_status_code != 200
                error = access_token_response['error']
                error_description = access_token_response['error_description']
                raise OAuth2Exception.new("There was an error while retrieving the OAuth2 access token: #{error} - #{error_description}")
              end

              token = access_token_response['access_token']
              expiration = start_time + access_token_response['expires_in']
              AccessToken.new(token, expiration)
            end
          end

          def new_connection
            connection = Worldline::Acquiring::SDK::Communication::DefaultConnection.new({ connect_timeout: @connect_timeout,
                                                                                           socket_timeout: @socket_timeout,
                                                                                           max_connections: 1,
                                                                                           proxy_configuration: @proxy_configuration })
            yield connection
          ensure
            connection.close
          end
        end
      end
    end
  end
end
