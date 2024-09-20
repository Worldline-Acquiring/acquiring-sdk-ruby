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
          # @attr [Worldline::Acquiring::SDK::V1::Domain::AmountData] amount
          # @attr [Integer] capture_sequence_number
          # @attr [Worldline::Acquiring::SDK::V1::Domain::DccData] dynamic_currency_conversion
          # @attr [true/false] is_final
          # @attr [String] operation_id
          # @attr [DateTime] transaction_timestamp
          class ApiCaptureRequest < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :amount

            attr_accessor :capture_sequence_number

            attr_accessor :dynamic_currency_conversion

            attr_accessor :is_final

            attr_accessor :operation_id

            attr_accessor :transaction_timestamp

            # @return (Hash)
            def to_h
              hash = super
              hash['amount'] = @amount.to_h unless @amount.nil?
              hash['captureSequenceNumber'] = @capture_sequence_number unless @capture_sequence_number.nil?
              hash['dynamicCurrencyConversion'] = @dynamic_currency_conversion.to_h unless @dynamic_currency_conversion.nil?
              hash['isFinal'] = @is_final unless @is_final.nil?
              hash['operationId'] = @operation_id unless @operation_id.nil?
              hash['transactionTimestamp'] = @transaction_timestamp.iso8601(3) unless @transaction_timestamp.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'amount'
                raise TypeError, "value '%s' is not a Hash" % [hash['amount']] unless hash['amount'].is_a? Hash
                @amount = Worldline::Acquiring::SDK::V1::Domain::AmountData.new_from_hash(hash['amount'])
              end
              if hash.has_key? 'captureSequenceNumber'
                @capture_sequence_number = hash['captureSequenceNumber']
              end
              if hash.has_key? 'dynamicCurrencyConversion'
                raise TypeError, "value '%s' is not a Hash" % [hash['dynamicCurrencyConversion']] unless hash['dynamicCurrencyConversion'].is_a? Hash
                @dynamic_currency_conversion = Worldline::Acquiring::SDK::V1::Domain::DccData.new_from_hash(hash['dynamicCurrencyConversion'])
              end
              if hash.has_key? 'isFinal'
                @is_final = hash['isFinal']
              end
              if hash.has_key? 'operationId'
                @operation_id = hash['operationId']
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
