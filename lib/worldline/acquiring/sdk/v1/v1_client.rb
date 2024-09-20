#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/api_resource'
require 'worldline/acquiring/sdk/v1/acquirer/acquirer_client'
require 'worldline/acquiring/sdk/v1/ping/ping_client'

module Worldline
  module Acquiring
    module SDK
      module V1
        # V1 client.
        #
        # Thread safe.
        class V1Client < Worldline::Acquiring::SDK::ApiResource

          # @param parent       [Worldline::Acquiring::SDK::ApiResource]
          # @param path_context [Hash, nil]
          def initialize(parent, path_context)
            super(parent: parent, path_context: path_context)
          end

          # Resource /processing/v1/{acquirerId}
          #
          # @param acquirer_id [String]
          # @return [Worldline::Acquiring::SDK::V1::Acquirer::AcquirerClient]
          def acquirer(acquirer_id)
            Worldline::Acquiring::SDK::V1::Acquirer::AcquirerClient.new(self, {
              'acquirerId'.freeze => acquirer_id,
            })
          end

          # Resource /services/v1/ping
          #
          # @return [Worldline::Acquiring::SDK::V1::Ping::PingClient]
          def ping
            Worldline::Acquiring::SDK::V1::Ping::PingClient.new(self, nil)
          end
        end
      end
    end
  end
end
