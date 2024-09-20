#
# This file was automatically generated.
#
require 'date'

require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/amount_data'
require 'worldline/acquiring/sdk/v1/domain/dcc_data'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Worldline::Acquiring::SDK::V1::Domain::DccData] dynamic_currency_conversion
          # @attr [String] operation_id
          # @attr [Worldline::Acquiring::SDK::V1::Domain::AmountData] reversal_amount
          # @attr [DateTime] transaction_timestamp
          class ApiPaymentReversalRequest < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :dynamic_currency_conversion

            attr_accessor :operation_id

            attr_accessor :reversal_amount

            attr_accessor :transaction_timestamp

            # @return (Hash)
            def to_h
              hash = super
              hash['dynamicCurrencyConversion'] = @dynamic_currency_conversion.to_h unless @dynamic_currency_conversion.nil?
              hash['operationId'] = @operation_id unless @operation_id.nil?
              hash['reversalAmount'] = @reversal_amount.to_h unless @reversal_amount.nil?
              hash['transactionTimestamp'] = @transaction_timestamp.iso8601(3) unless @transaction_timestamp.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'dynamicCurrencyConversion'
                raise TypeError, "value '%s' is not a Hash" % [hash['dynamicCurrencyConversion']] unless hash['dynamicCurrencyConversion'].is_a? Hash
                @dynamic_currency_conversion = Worldline::Acquiring::SDK::V1::Domain::DccData.new_from_hash(hash['dynamicCurrencyConversion'])
              end
              if hash.has_key? 'operationId'
                @operation_id = hash['operationId']
              end
              if hash.has_key? 'reversalAmount'
                raise TypeError, "value '%s' is not a Hash" % [hash['reversalAmount']] unless hash['reversalAmount'].is_a? Hash
                @reversal_amount = Worldline::Acquiring::SDK::V1::Domain::AmountData.new_from_hash(hash['reversalAmount'])
              end
              if hash.has_key? 'transactionTimestamp'
                @transaction_timestamp = DateTime.parse(hash['transactionTimestamp'])
              end
            end
          end
        end
      end
    end
  end
end
