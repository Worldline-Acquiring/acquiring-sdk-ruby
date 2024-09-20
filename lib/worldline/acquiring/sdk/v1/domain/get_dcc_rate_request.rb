#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/card_data_for_dcc'
require 'worldline/acquiring/sdk/v1/domain/point_of_sale_data_for_dcc'
require 'worldline/acquiring/sdk/v1/domain/transaction_data_for_dcc'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Worldline::Acquiring::SDK::V1::Domain::CardDataForDcc] card_payment_data
          # @attr [String] operation_id
          # @attr [Worldline::Acquiring::SDK::V1::Domain::PointOfSaleDataForDcc] point_of_sale_data
          # @attr [String] rate_reference_id
          # @attr [String] target_currency
          # @attr [Worldline::Acquiring::SDK::V1::Domain::TransactionDataForDcc] transaction
          class GetDCCRateRequest < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :card_payment_data

            attr_accessor :operation_id

            attr_accessor :point_of_sale_data

            attr_accessor :rate_reference_id

            attr_accessor :target_currency

            attr_accessor :transaction

            # @return (Hash)
            def to_h
              hash = super
              hash['cardPaymentData'] = @card_payment_data.to_h unless @card_payment_data.nil?
              hash['operationId'] = @operation_id unless @operation_id.nil?
              hash['pointOfSaleData'] = @point_of_sale_data.to_h unless @point_of_sale_data.nil?
              hash['rateReferenceId'] = @rate_reference_id unless @rate_reference_id.nil?
              hash['targetCurrency'] = @target_currency unless @target_currency.nil?
              hash['transaction'] = @transaction.to_h unless @transaction.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'cardPaymentData'
                raise TypeError, "value '%s' is not a Hash" % [hash['cardPaymentData']] unless hash['cardPaymentData'].is_a? Hash
                @card_payment_data = Worldline::Acquiring::SDK::V1::Domain::CardDataForDcc.new_from_hash(hash['cardPaymentData'])
              end
              if hash.has_key? 'operationId'
                @operation_id = hash['operationId']
              end
              if hash.has_key? 'pointOfSaleData'
                raise TypeError, "value '%s' is not a Hash" % [hash['pointOfSaleData']] unless hash['pointOfSaleData'].is_a? Hash
                @point_of_sale_data = Worldline::Acquiring::SDK::V1::Domain::PointOfSaleDataForDcc.new_from_hash(hash['pointOfSaleData'])
              end
              if hash.has_key? 'rateReferenceId'
                @rate_reference_id = hash['rateReferenceId']
              end
              if hash.has_key? 'targetCurrency'
                @target_currency = hash['targetCurrency']
              end
              if hash.has_key? 'transaction'
                raise TypeError, "value '%s' is not a Hash" % [hash['transaction']] unless hash['transaction'].is_a? Hash
                @transaction = Worldline::Acquiring::SDK::V1::Domain::TransactionDataForDcc.new_from_hash(hash['transaction'])
              end
            end
          end
        end
      end
    end
  end
end
