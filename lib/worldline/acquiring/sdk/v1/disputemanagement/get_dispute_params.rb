#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/communication/param_request'
require 'worldline/acquiring/sdk/communication/request_param'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Disputemanagement
          # Query parameters for {https://docs.acquiring.worldline-solutions.com/api-reference#tag/Dispute-Management/operation/getDispute Retrieve Dispute}
          #
          # @attr [true/false] include_entries
          class GetDisputeParams < Worldline::Acquiring::SDK::Communication::ParamRequest

            attr_accessor :include_entries

            # @return [Array<Worldline::Acquiring::SDK::Communication::RequestParam>] representing the attributes of this class
            def to_request_parameters
              result = []
              result << Worldline::Acquiring::SDK::Communication::RequestParam.new('includeEntries', @include_entries.to_s) unless @include_entries.nil?
              result
            end
          end
        end
      end
    end
  end
end
