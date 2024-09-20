#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/communication/param_request'
require 'worldline/acquiring/sdk/communication/request_param'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Acquirer
          module Merchant
            module Payments
              # Query parameters for {https://docs.acquiring.worldline-solutions.com/api-reference#tag/Payments/operation/getPaymentStatus Retrieve payment}
              #
              # @attr [true/false] return_operations
              class GetPaymentStatusParams < Worldline::Acquiring::SDK::Communication::ParamRequest

                attr_accessor :return_operations

                # @return [Array<Worldline::Acquiring::SDK::Communication::RequestParam>] representing the attributes of this class
                def to_request_parameters
                  result = []
                  result << RequestParam.new('returnOperations', @return_operations.to_s) unless @return_operations.nil?
                  result
                end
              end
            end
          end
        end
      end
    end
  end
end
