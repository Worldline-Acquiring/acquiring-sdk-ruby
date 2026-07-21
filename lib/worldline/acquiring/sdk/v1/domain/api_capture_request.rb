#
# This file was automatically generated.
#
require 'date'

require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/amount_data'
require 'worldline/acquiring/sdk/v1/domain/capture_amount_breakdown_data'
require 'worldline/acquiring/sdk/v1/domain/dcc_data'
require 'worldline/acquiring/sdk/v1/domain/marketplace_data'
require 'worldline/acquiring/sdk/v1/domain/payment_references'
require 'worldline/acquiring/sdk/v1/domain/terminal_data'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Worldline::Acquiring::SDK::V1::Domain::AmountData] amount
          # @attr [Worldline::Acquiring::SDK::V1::Domain::CaptureAmountBreakdownData] capture_amount_breakdown_data
          # @attr [Integer] capture_sequence_number
          # @attr [Worldline::Acquiring::SDK::V1::Domain::DccData] dynamic_currency_conversion
          # @attr [true/false] is_final
          # @attr [Worldline::Acquiring::SDK::V1::Domain::MarketplaceData] marketplace_data
          # @attr [String] operation_id
          # @attr [Worldline::Acquiring::SDK::V1::Domain::PaymentReferences] references
          # @attr [Worldline::Acquiring::SDK::V1::Domain::TerminalData] terminal_data
          # @attr [DateTime] transaction_timestamp
          class ApiCaptureRequest < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :amount

            attr_accessor :capture_amount_breakdown_data

            attr_accessor :capture_sequence_number

            attr_accessor :dynamic_currency_conversion

            attr_accessor :is_final

            attr_accessor :marketplace_data

            attr_accessor :operation_id

            attr_accessor :references

            attr_accessor :terminal_data

            attr_accessor :transaction_timestamp

            # @return (Hash)
            def to_h
              hash = super
              hash['amount'] = @amount.to_h unless @amount.nil?
              hash['captureAmountBreakdownData'] = @capture_amount_breakdown_data.to_h unless @capture_amount_breakdown_data.nil?
              hash['captureSequenceNumber'] = @capture_sequence_number unless @capture_sequence_number.nil?
              hash['dynamicCurrencyConversion'] = @dynamic_currency_conversion.to_h unless @dynamic_currency_conversion.nil?
              hash['isFinal'] = @is_final unless @is_final.nil?
              hash['marketplaceData'] = @marketplace_data.to_h unless @marketplace_data.nil?
              hash['operationId'] = @operation_id unless @operation_id.nil?
              hash['references'] = @references.to_h unless @references.nil?
              hash['terminalData'] = @terminal_data.to_h unless @terminal_data.nil?
              hash['transactionTimestamp'] = @transaction_timestamp.iso8601(3) unless @transaction_timestamp.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'amount'
                raise TypeError, "value '%s' is not a Hash" % [hash['amount']] unless hash['amount'].is_a? Hash
                @amount = Worldline::Acquiring::SDK::V1::Domain::AmountData.new_from_hash(hash['amount'])
              end
              if hash.has_key? 'captureAmountBreakdownData'
                raise TypeError, "value '%s' is not a Hash" % [hash['captureAmountBreakdownData']] unless hash['captureAmountBreakdownData'].is_a? Hash
                @capture_amount_breakdown_data = Worldline::Acquiring::SDK::V1::Domain::CaptureAmountBreakdownData.new_from_hash(hash['captureAmountBreakdownData'])
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
              if hash.has_key? 'marketplaceData'
                raise TypeError, "value '%s' is not a Hash" % [hash['marketplaceData']] unless hash['marketplaceData'].is_a? Hash
                @marketplace_data = Worldline::Acquiring::SDK::V1::Domain::MarketplaceData.new_from_hash(hash['marketplaceData'])
              end
              if hash.has_key? 'operationId'
                @operation_id = hash['operationId']
              end
              if hash.has_key? 'references'
                raise TypeError, "value '%s' is not a Hash" % [hash['references']] unless hash['references'].is_a? Hash
                @references = Worldline::Acquiring::SDK::V1::Domain::PaymentReferences.new_from_hash(hash['references'])
              end
              if hash.has_key? 'terminalData'
                raise TypeError, "value '%s' is not a Hash" % [hash['terminalData']] unless hash['terminalData'].is_a? Hash
                @terminal_data = Worldline::Acquiring::SDK::V1::Domain::TerminalData.new_from_hash(hash['terminalData'])
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
