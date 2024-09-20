#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/api_resource'
require 'worldline/acquiring/sdk/logging/logging_capable'
require 'worldline/acquiring/sdk/logging/obfuscation/obfuscation_capable'
require 'worldline/acquiring/sdk/v1/v1_client'

module Worldline
  module Acquiring
    module SDK
      # Worldline Acquiring platform client.
      #
      # Thread safe.
      class Client < ApiResource
        include Logging::LoggingCapable
        include Logging::Obfuscation::ObfuscationCapable

        # @param communicator [Worldline::Acquiring::SDK::Communicator]
        def initialize(communicator)
          super(communicator: communicator)
        end

        # Utility method that delegates the call to this client's communicator.
        def close_idle_connections(idle_time)
          @communicator.close_idle_connections(idle_time)
        end

        # Utility method that delegates the call to this client's communicator.
        def close_expired_connections
          @communicator.close_expired_connections
        end

        # Sets the current body obfuscator to use.
        # @param body_obfuscator [Worldline::Acquiring::SDK::Logging::Obfuscation::BodyObfuscator]
        def set_body_obfuscator(body_obfuscator)
          @communicator.set_body_obfuscator(body_obfuscator)
        end

        # Sets the current header obfuscator to use.
        # @param header_obfuscator [Worldline::Acquiring::SDK::Logging::Obfuscation::HeaderObfuscator]
        def set_header_obfuscator(header_obfuscator)
          @communicator.set_header_obfuscator(header_obfuscator)
        end

        # Turns on logging using the given communicator logger.
        # @param communicator_logger [Worldline::Acquiring::SDK::Logging::CommunicatorLogger]
        def enable_logging(communicator_logger)
          @communicator.enable_logging(communicator_logger)
        end

        # Turns off logging.
        def disable_logging
          @communicator.disable_logging
        end

        # Releases any system resources associated with this object.
        def close
          @communicator.close
        end

        # @return [Worldline::Acquiring::SDK::V1::V1Client]
        def v1
          Worldline::Acquiring::SDK::V1::V1Client.new(self, nil)
        end
      end
    end
  end
end
