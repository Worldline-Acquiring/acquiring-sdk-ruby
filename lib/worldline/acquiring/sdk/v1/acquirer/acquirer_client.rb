#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/api_resource'
require 'worldline/acquiring/sdk/v1/acquirer/merchant/merchant_client'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Acquirer
          # Acquirer client. Thread-safe.
          class AcquirerClient < Worldline::Acquiring::SDK::ApiResource

            # @param parent       [Worldline::Acquiring::SDK::ApiResource]
            # @param path_context [Hash, nil]
            def initialize(parent, path_context)
              super(parent: parent, path_context: path_context)
            end

            # Resource /processing/v1/{acquirerId}/{merchantId}
            #
            # @param merchant_id [String]
            # @return [Worldline::Acquiring::SDK::V1::Acquirer::Merchant::MerchantClient]
            def merchant(merchant_id)
              Worldline::Acquiring::SDK::V1::Acquirer::Merchant::MerchantClient.new(self, {
                'merchantId'.freeze => merchant_id,
              })
            end
          end
        end
      end
    end
  end
end
