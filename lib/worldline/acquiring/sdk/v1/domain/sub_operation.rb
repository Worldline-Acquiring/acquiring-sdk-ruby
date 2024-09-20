#
# This file was automatically generated.
#
require 'date'

require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/amount_data'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Worldline::Acquiring::SDK::V1::Domain::AmountData] amount
          # @attr [String] authorization_code
          # @attr [String] operation_id
          # @attr [DateTime] operation_timestamp
          # @attr [String] operation_type
          # @attr [String] response_code
          # @attr [String] response_code_category
          # @attr [String] response_code_description
          # @attr [String] retry_after
          class SubOperation < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :amount

            attr_accessor :authorization_code

            attr_accessor :operation_id

            attr_accessor :operation_timestamp

            attr_accessor :operation_type

            attr_accessor :response_code

            attr_accessor :response_code_category

            attr_accessor :response_code_description

            attr_accessor :retry_after

            # @return (Hash)
            def to_h
              hash = super
              hash['amount'] = @amount.to_h unless @amount.nil?
              hash['authorizationCode'] = @authorization_code unless @authorization_code.nil?
              hash['operationId'] = @operation_id unless @operation_id.nil?
              hash['operationTimestamp'] = @operation_timestamp.iso8601(3) unless @operation_timestamp.nil?
              hash['operationType'] = @operation_type unless @operation_type.nil?
              hash['responseCode'] = @response_code unless @response_code.nil?
              hash['responseCodeCategory'] = @response_code_category unless @response_code_category.nil?
              hash['responseCodeDescription'] = @response_code_description unless @response_code_description.nil?
              hash['retryAfter'] = @retry_after unless @retry_after.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'amount'
                raise TypeError, "value '%s' is not a Hash" % [hash['amount']] unless hash['amount'].is_a? Hash
                @amount = Worldline::Acquiring::SDK::V1::Domain::AmountData.new_from_hash(hash['amount'])
              end
              if hash.has_key? 'authorizationCode'
                @authorization_code = hash['authorizationCode']
              end
              if hash.has_key? 'operationId'
                @operation_id = hash['operationId']
              end
              if hash.has_key? 'operationTimestamp'
                @operation_timestamp = DateTime.parse(hash['operationTimestamp'])
              end
              if hash.has_key? 'operationType'
                @operation_type = hash['operationType']
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
              if hash.has_key? 'retryAfter'
                @retry_after = hash['retryAfter']
              end
            end
          end
        end
      end
    end
  end
end
