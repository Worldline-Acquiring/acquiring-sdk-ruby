#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/api_refund_summary_for_response'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] operation_id
          # @attr [Worldline::Acquiring::SDK::V1::Domain::ApiRefundSummaryForResponse] refund
          # @attr [String] responder
          # @attr [String] response_code
          # @attr [String] response_code_category
          # @attr [String] response_code_description
          class ApiActionResponseForRefund < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :operation_id

            attr_accessor :refund

            attr_accessor :responder

            attr_accessor :response_code

            attr_accessor :response_code_category

            attr_accessor :response_code_description

            # @return (Hash)
            def to_h
              hash = super
              hash['operationId'] = @operation_id unless @operation_id.nil?
              hash['refund'] = @refund.to_h unless @refund.nil?
              hash['responder'] = @responder unless @responder.nil?
              hash['responseCode'] = @response_code unless @response_code.nil?
              hash['responseCodeCategory'] = @response_code_category unless @response_code_category.nil?
              hash['responseCodeDescription'] = @response_code_description unless @response_code_description.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'operationId'
                @operation_id = hash['operationId']
              end
              if hash.has_key? 'refund'
                raise TypeError, "value '%s' is not a Hash" % [hash['refund']] unless hash['refund'].is_a? Hash
                @refund = Worldline::Acquiring::SDK::V1::Domain::ApiRefundSummaryForResponse.new_from_hash(hash['refund'])
              end
              if hash.has_key? 'responder'
                @responder = hash['responder']
              end
              if hash.has_key? 'responseCode'
                @response_code = hash['responseCode']
              end
              if hash.has_key? 'responseCodeCategory'
                @response_code_category = hash['responseCodeCategory']
              end
              if hash.has_key? 'responseCodeDescription'
                @response_code_description = hash['responseCodeDescription']
              end
            end
          end
        end
      end
    end
  end
end
