#
# This file was automatically generated.
#
require 'date'

require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/amount_data'
require 'worldline/acquiring/sdk/v1/domain/card_payment_data'
require 'worldline/acquiring/sdk/v1/domain/dcc_data'
require 'worldline/acquiring/sdk/v1/domain/merchant_data'
require 'worldline/acquiring/sdk/v1/domain/payment_references'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Worldline::Acquiring::SDK::V1::Domain::AmountData] amount
          # @attr [String] authorization_type
          # @attr [Worldline::Acquiring::SDK::V1::Domain::CardPaymentData] card_payment_data
          # @attr [Worldline::Acquiring::SDK::V1::Domain::DccData] dynamic_currency_conversion
          # @attr [Worldline::Acquiring::SDK::V1::Domain::MerchantData] merchant
          # @attr [String] operation_id
          # @attr [Worldline::Acquiring::SDK::V1::Domain::PaymentReferences] references
          # @attr [DateTime] transaction_timestamp
          class ApiPaymentRequest < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :amount

            attr_accessor :authorization_type

            attr_accessor :card_payment_data

            attr_accessor :dynamic_currency_conversion

            attr_accessor :merchant

            attr_accessor :operation_id

            attr_accessor :references

            attr_accessor :transaction_timestamp

            # @return (Hash)
            def to_h
              hash = super
              hash['amount'] = @amount.to_h unless @amount.nil?
              hash['authorizationType'] = @authorization_type unless @authorization_type.nil?
              hash['cardPaymentData'] = @card_payment_data.to_h unless @card_payment_data.nil?
              hash['dynamicCurrencyConversion'] = @dynamic_currency_conversion.to_h unless @dynamic_currency_conversion.nil?
              hash['merchant'] = @merchant.to_h unless @merchant.nil?
              hash['operationId'] = @operation_id unless @operation_id.nil?
              hash['references'] = @references.to_h unless @references.nil?
              hash['transactionTimestamp'] = @transaction_timestamp.iso8601(3) unless @transaction_timestamp.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'amount'
                raise TypeError, "value '%s' is not a Hash" % [hash['amount']] unless hash['amount'].is_a? Hash
                @amount = Worldline::Acquiring::SDK::V1::Domain::AmountData.new_from_hash(hash['amount'])
              end
              if hash.has_key? 'authorizationType'
                @authorization_type = hash['authorizationType']
              end
              if hash.has_key? 'cardPaymentData'
                raise TypeError, "value '%s' is not a Hash" % [hash['cardPaymentData']] unless hash['cardPaymentData'].is_a? Hash
                @card_payment_data = Worldline::Acquiring::SDK::V1::Domain::CardPaymentData.new_from_hash(hash['cardPaymentData'])
              end
              if hash.has_key? 'dynamicCurrencyConversion'
                raise TypeError, "value '%s' is not a Hash" % [hash['dynamicCurrencyConversion']] unless hash['dynamicCurrencyConversion'].is_a? Hash
                @dynamic_currency_conversion = Worldline::Acquiring::SDK::V1::Domain::DccData.new_from_hash(hash['dynamicCurrencyConversion'])
              end
              if hash.has_key? 'merchant'
                raise TypeError, "value '%s' is not a Hash" % [hash['merchant']] unless hash['merchant'].is_a? Hash
                @merchant = Worldline::Acquiring::SDK::V1::Domain::MerchantData.new_from_hash(hash['merchant'])
              end
              if hash.has_key? 'operationId'
                @operation_id = hash['operationId']
              end
              if hash.has_key? 'references'
                raise TypeError, "value '%s' is not a Hash" % [hash['references']] unless hash['references'].is_a? Hash
                @references = Worldline::Acquiring::SDK::V1::Domain::PaymentReferences.new_from_hash(hash['references'])
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
