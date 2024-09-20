require 'yaml'
require 'worldline/acquiring/sdk/client'
require 'worldline/acquiring/sdk/communicator'
require 'worldline/acquiring/sdk/communicator_configuration'
require 'worldline/acquiring/sdk/authentication/authorization_type'
require 'worldline/acquiring/sdk/authentication/oauth2_authenticator'
require 'worldline/acquiring/sdk/communication/default_connection'
require 'worldline/acquiring/sdk/communication/metadata_provider'
require 'worldline/acquiring/sdk/json/default_marshaller'

module Worldline
  module Acquiring
    module SDK
      # Convenience class that constructs instances of several other classes in the SDK.
      # Provides methods to construct
      # {Worldline::Acquiring::SDK::CommunicatorConfiguration}, {Worldline::Acquiring::SDK::Communicator} and {Worldline::Acquiring::SDK::Client} instances.
      class Factory

        # Creates and returns a {Worldline::Acquiring::SDK::CommunicatorConfiguration} based on the configuration in the file
        # located at _configuration_file_name_.
        #
        # @param configuration_file_name [String] Path to the configuration file to use, should be in YAML format.
        # @param authorization_id        [String] Authorization id, e.g. the key id for the Worldline Acquiring platform.
        # @param authorization_secret    [String] Authorization secret, e.g. the secret key used for authentication to the Worldline Acquiring platform.
        # @return [Worldline::Acquiring::SDK::CommunicatorConfiguration] The created communicator configuration
        def self.create_configuration(configuration_file_name, authorization_id, authorization_secret)
          properties = YAML::load_file(configuration_file_name)
          CommunicatorConfiguration.new(properties: properties,
                                        authorization_id: authorization_id,
                                        authorization_secret: authorization_secret)
        end

        # Creates and returns a {Worldline::Acquiring::SDK::Communicator} from a {Worldline::Acquiring::SDK::CommunicatorConfiguration},
        # a {Worldline::Acquiring::SDK::Communication::MetadataProvider}, a {Worldline::Acquiring::SDK::Communication::Connection},
        # an {Worldline::Acquiring::SDK::Authentication::Authenticator} and a {Worldline::Acquiring::SDK::JSON::Marshaller}.
        #
        # @param configuration     [Worldline::Acquiring::SDK::CommunicatorConfiguration] configuration settings to be used by the client.
        # @param metadata_provider [Worldline::Acquiring::SDK::Communication::MetadataProvider] stores the metadata for the communicating client.
        # @param connection        [Worldline::Acquiring::SDK::Communication::Connection] connection that can be used to communicate with the Worldline Acquiring platform.
        # @param authenticator     [Worldline::Acquiring::SDK::Authentication::Authenticator] authenticator that can authenticate messages sent to the Worldline Acquiring platform.
        # @param marshaller        [Worldline::Acquiring::SDK::JSON::Marshaller] marshaller that can marshal and unmarshal objects to and from JSON.
        # @return [Worldline::Acquiring::SDK::Communicator] The created communicator
        def self.create_communicator_from_configuration(configuration, metadata_provider: nil,
                                                        connection: nil, authenticator: nil, marshaller: nil)
          unless metadata_provider
            metadata_provider = MetadataProvider.new(configuration.integrator,
                                                      shopping_cart_extension: configuration.shopping_cart_extension)
          end
          unless connection
            connection = Communication::DefaultConnection.new({ connect_timeout: configuration.connect_timeout,
                                                                socket_timeout: configuration.socket_timeout,
                                                                max_connections: configuration.max_connections,
                                                                proxy_configuration: configuration.proxy_configuration })
          end
          unless authenticator
            authenticator = get_authenticator(configuration)
          end
          unless marshaller
            marshaller = DefaultMarshaller.instance
          end
          Communicator.new(configuration.api_endpoint, connection, authenticator, metadata_provider, marshaller)
        end

        # Creates and returns a {Worldline::Acquiring::SDK::Communicator} from a file containing the communicator configuration, authorization_id, authorization_secret,
        # a {Worldline::Acquiring::SDK::Communication::MetadataProvider}, a {Worldline::Acquiring::SDK::Communication::Connection}.
        # an {Worldline::Acquiring::SDK::Authentication::Authenticator} and a {Worldline::Acquiring::SDK::JSON::Marshaller}.
        #
        # @param configuration_file_name [String] Path to the configuration file to use, should be in YAML format.
        # @param authorization_id        [String] Authorization id, e.g. the key id for the Worldline Acquiring platform.
        # @param authorization_secret    [String] Authorization secret, e.g. the secret key used for authentication to the Worldline Acquiring platform.
        # @param metadata_provider       [Worldline::Acquiring::SDK::Communication::MetadataProvider] stores the metadata for the communicating client.
        # @param connection              [Worldline::Acquiring::SDK::Communication::Connection] connection that can be used to communicate with the Worldline Acquiring platform.
        # @param authenticator           [Worldline::Acquiring::SDK::Authentication::Authenticator] authenticator that can authenticate messages sent to the Worldline Acquiring platform.
        # @param marshaller              [Worldline::Acquiring::SDK::JSON::Marshaller] marshaller that can marshal and unmarshal objects to and from JSON.
        # @return [Worldline::Acquiring::SDK::Communicator] The created communicator
        def self.create_communicator_from_file(configuration_file_name, authorization_id, authorization_secret,
                                               metadata_provider: nil, connection: nil, authenticator: nil, marshaller: nil)
          configuration = create_configuration(configuration_file_name, authorization_id, authorization_secret)
          create_communicator_from_configuration(configuration, metadata_provider: metadata_provider, connection: connection,
                                                 authenticator: authenticator, marshaller: marshaller)
        end

        # Creates and returns an {Worldline::Acquiring::SDK::Client} that provides the a high-level interface with the Worldline Acquiring platform.
        # If a code block is given, the created client is returned to the code block and closed afterwards.
        #
        # @example Providing a code block
        #           Factory.create_client_from_configuration(configuration) do |client|
        #             # use client as needed
        #           end
        #           # client is closed here
        #
        # @param configuration     [Worldline::Acquiring::SDK::CommunicatorConfiguration] contains configuration settings to be used by the client.
        # @param metadata_provider [Worldline::Acquiring::SDK::Communication::MetadataProvider] stores the metadata for the communicating client.
        # @param connection        [Worldline::Acquiring::SDK::Communication::Connection] connection that can be used to communicate with the Worldline Acquiring platform.
        # @param authenticator     [Worldline::Acquiring::SDK::Authentication::Authenticator] authenticator that can authenticate messages sent to the Worldline Acquiring platform.
        # @param marshaller        [Worldline::Acquiring::SDK::JSON::Marshaller] marshaller that can marshal and unmarshal objects to and from JSON.
        # @return [Worldline::Acquiring::SDK::Client] The created client
        def self.create_client_from_configuration(configuration, metadata_provider: nil, connection: nil, authenticator: nil, marshaller: nil)
          communicator = create_communicator_from_configuration(configuration, metadata_provider: metadata_provider, connection: connection,
                                                                authenticator: authenticator, marshaller: marshaller)
          client = Client.new(communicator)
          if block_given?
            begin
              yield client
            ensure
              client.close
            end
          else
            return client
          end
        end

        # Creates and returns an {Worldline::Acquiring::SDK::Client} that provides the a high-level interface with the Worldline Acquiring platform.
        # If a code block is given, the created client is returned to the code block and closed afterwards.
        #
        # @example Providing a code block
        #           Factory.create_client_from_communicator(communicator) do |client|
        #             # use client as needed
        #           end
        #           # client is closed here
        #
        # @param communicator [Worldline::Acquiring::SDK::Communicator] provides network communication service for the Client
        # @return [Worldline::Acquiring::SDK::Client] The created client
        def self.create_client_from_communicator(communicator)
          client = Client.new(communicator)
          if block_given?
            begin
              yield client
            ensure
              client.close
            end
          else
            return client
          end
        end

        # Creates and returns an {Worldline::Acquiring::SDK::Client} that provides the a high-level interface with the Worldline Acquiring platform.
        # If a code block is given, the created client is returned to the code block and closed afterwards.
        #
        # @example Providing a code block
        #           Factory.create_client_from_file(configuration_file_name, authorization_id, authorization_secret) do |client|
        #             # use client as needed
        #           end
        #           # client is closed here
        #
        # @param configuration_file_name [String] Path to the configuration file to use, should be in YAML format.
        # @param authorization_id        [String] Authorization id, e.g. the key id for the Worldline Acquiring platform.
        # @param authorization_secret    [String] Authorization secret, e.g. the secret key used for authentication to the Worldline Acquiring platform.
        # @param metadata_provider       [Worldline::Acquiring::SDK::Communication::MetadataProvider] stores the metadata for the communicating client.
        # @param connection              [Worldline::Acquiring::SDK::Communication::Connection] connection that can be used to communicate with the Worldline Acquiring platform.
        # @param authenticator           [Worldline::Acquiring::SDK::Authentication::Authenticator] authenticator that can authenticate messages sent to the Worldline Acquiring platform.
        # @param marshaller              [Worldline::Acquiring::SDK::JSON::Marshaller] marshaller that can marshal and unmarshal objects to and from JSON.
        # @return [Worldline::Acquiring::SDK::Client] The created client
        def self.create_client_from_file(configuration_file_name, authorization_id, authorization_secret,
                                         metadata_provider: nil, connection: nil, authenticator: nil, marshaller: nil)
          communicator = create_communicator_from_file(configuration_file_name, authorization_id, authorization_secret,
                                                       metadata_provider: metadata_provider, connection: connection,
                                                       authenticator: authenticator, marshaller: marshaller)
          client = Client.new(communicator)
          if block_given?
            begin
              yield client
            ensure
              client.close
            end
          else
            return client
          end
        end

        private

        # @param configuration [Worldline::Acquiring::SDK::CommunicatorConfiguration]
        def self.get_authenticator(configuration)
          if configuration.authorization_type == Authentication::AuthorizationType::OAUTH2
            return Authentication::OAuth2Authenticator.new(configuration)
          end
          raise RuntimeError.new("Unknown authorizationType #{configuration.authorization_type}")
        end
      end
    end
  end
end
