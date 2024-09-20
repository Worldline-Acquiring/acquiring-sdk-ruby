require 'base64'
require 'worldline/acquiring/sdk/communication/request_header'
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/domain/shopping_cart_extension'
require 'worldline/acquiring/sdk/json/default_marshaller'

module Worldline
  module Acquiring
    module SDK
      module Communication
        # Manages metadata about the server using the SDK
        #
        # @attr_reader [Array<Worldline::Acquiring::SDK::Communication::RequestHeader>] metadata_headers List of headers that should be used in all requests.
        class MetadataProvider
          private

          SDK_VERSION = '0.1.0'.freeze
          SERVER_META_INFO_HEADER = 'X-WL-ServerMetaInfo'.freeze
          PROHIBITED_HEADERS = [SERVER_META_INFO_HEADER, 'Date', 'Content-Type', 'Authorization'].sort!.freeze
          CHARSET = 'utf-8'.freeze

          public

          # Stores metadata about the server so it can be sent to the Worldline Acquiring platform
          class ServerMetaInfo < Worldline::Acquiring::SDK::Domain::DataObject
            @platform_identifier = nil
            @sdk_identifier = nil
            @sdk_creator = nil
            @integrator = nil
            @shopping_cart_extension = nil

            # String containing system information (Operating system and Ruby version).
            attr_accessor :platform_identifier

            # String containing this SDK version.
            attr_accessor :sdk_identifier

            attr_accessor :sdk_creator

            attr_accessor :integrator

            attr_accessor :shopping_cart_extension

            # Returns the values of all attributes as a hash.
            def to_h
              hash = super
              hash['platformIdentifier'] = @platform_identifier unless @platform_identifier.nil?
              hash['sdkIdentifier'] = @sdk_identifier unless @sdk_identifier.nil?
              hash['sdkCreator'] = @sdk_creator unless @sdk_creator.nil?
              hash['integrator'] = @integrator unless @integrator.nil?
              hash['shoppingCartExtension'] = @shopping_cart_extension.to_h unless @shopping_cart_extension.nil?
              hash
            end

            # Initializes the ServerMetaInfo object with properties stored in the parameter hash
            def from_hash(hash)
              super
              @platform_identifier = hash['platformIdentifier'] if hash.has_key? 'platformIdentifier'
              @sdk_identifier = hash['sdkIdentifier'] if hash.has_key? 'sdkIdentifier'
              @sdk_creator = hash['sdkCreator'] if hash.has_key? 'sdkCreator'
              @integrator = hash['integrator'] if hash.has_key? 'integrator'
              @shopping_cart_extension = Worldline::Acquiring::SDK::Domain::ShoppingCartExtension.new_from_hash(hash['shoppingCartExtension']) if hash.has_key? 'shoppingCartExtension'
            end
          end

          # Create a new MetadataProvider instance that can be used to access platform-related information
          #
          # @param integrator                 [String] Name of the integrator
          # @param shopping_cart_extension    [Worldline::Acquiring::SDK::Domain::ShoppingCartExtension] shopping cart-related metadata.
          # @param additional_request_headers [Array<Worldline::Acquiring::SDK::Communication::RequestHeader>] list of additional headers to include in all requests made.
          #                                   The following headers are not allowed due to conflicts with already added headers:
          #                                   'Date', 'Content-Type', 'Authorization' and 'X-WL-ServerMetaInfo'
          def initialize(integrator, shopping_cart_extension: nil, additional_request_headers: [].freeze)
            raise ArgumentError.new('integrator is required') if integrator.nil? or integrator.strip.empty?
            MetadataProvider.validate_additional_request_headers(additional_request_headers)
            server_meta_info = ServerMetaInfo.new
            server_meta_info.platform_identifier = get_platform_identifier
            server_meta_info.sdk_identifier = get_sdk_identifier
            server_meta_info.sdk_creator = 'Worldline'
            server_meta_info.integrator = integrator
            server_meta_info.shopping_cart_extension = shopping_cart_extension unless shopping_cart_extension.nil?
            server_meta_info_string = Worldline::Acquiring::SDK::JSON::DefaultMarshaller.instance.marshal(server_meta_info)
            server_meta_info_header = RequestHeader.new(
              SERVER_META_INFO_HEADER, Base64.strict_encode64(
              server_meta_info_string.force_encoding('iso-8859-1').encode(CHARSET)))
            if additional_request_headers.nil? || additional_request_headers.empty?
              @metadata_headers = [server_meta_info_header].freeze
            else
              request_headers = [server_meta_info_header]
              request_headers += additional_request_headers
              @metadata_headers = request_headers.freeze
            end
          end

          # Checks that none of the {Worldline::Acquiring::SDK::Communication::RequestHeaders} in _additional_request_headers_ is equal to any of the forbidden headers.
          # The forbidden headers are:
          # 'Date', 'Content-Type', 'Authorization' and 'X-WL-ServerMetaInfo'
          # If a header is found that is equal to one of the forbidden headers an ArgumentError is raised.
          def self.validate_additional_request_headers(additional_request_headers)
            unless additional_request_headers.nil?
              additional_request_headers.each { |additional_request_header|
                validate_additional_request_header(additional_request_header)
              }
            end
          end

          # Checks that the {Worldline::Acquiring::SDK::Communication::RequestHeaders} _additional_request_header_ is equal to any of the forbidden headers.
          # The forbidden headers are:
          # 'Date', 'Content-Type', 'Authorization' and 'X-WL-ServerMetaInfo'
          # If the header is equal to one of the forbidden headers an ArgumentError is raised.
          def self.validate_additional_request_header(additional_request_header)
            if prohibited_headers.include? additional_request_header.name
              raise ArgumentError.new('request header not allowed' + additional_request_header.name)
            end
          end

          protected

          # String containing information of the system using the SDK.
          # It contains data like Operating System version and Ruby version
          def get_platform_identifier
            config = RbConfig::CONFIG['host_os']
            if config.include? 'mingw'
              s = 'Windows'
            elsif config.include? 'linux'
              s = 'Linux'
            else
              s = 'Mac OS X'
            end
            s + '/' + RUBY_DESCRIPTION
          end

          # String describing the version of the SDK being used
          def get_sdk_identifier
            'RubyServerSDK/v' + SDK_VERSION
          end

          public

          # Version of this SDK being used
          def self.sdk_version
            SDK_VERSION
          end

          # A {Worldline::Acquiring::SDK::Communication::RequestHeader} that contains serialized and encoded
          # {Worldline::Acquiring::SDK::Communication::MetadataProvider::ServerMetaInfo}.
          def self.server_meta_info_header
            SERVER_META_INFO_HEADER
          end

          # A list of header names that should not be used by any added headers.
          # These headers are reserved for specific purposes.
          def self.prohibited_headers
            PROHIBITED_HEADERS
          end

          attr_reader :metadata_headers
        end
      end
    end
  end
end
