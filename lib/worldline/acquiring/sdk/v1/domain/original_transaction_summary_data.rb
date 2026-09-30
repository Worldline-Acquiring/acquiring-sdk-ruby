#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/payment_method_data_base'
require 'worldline/acquiring/sdk/v1/domain/transaction_references_base'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] cardholder_verification_method
          # @attr [String] payment_category
          # @attr [Worldline::Acquiring::SDK::V1::Domain::PaymentMethodDataBase] payment_method_data
          # @attr [String] point_of_sale_entry_mode
          # @attr [Worldline::Acquiring::SDK::V1::Domain::TransactionReferencesBase] transaction_references
          class OriginalTransactionSummaryData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :cardholder_verification_method

            attr_accessor :payment_category

            attr_accessor :payment_method_data

            attr_accessor :point_of_sale_entry_mode

            attr_accessor :transaction_references

            # @return (Hash)
            def to_h
              hash = super
              hash['cardholderVerificationMethod'] = @cardholder_verification_method unless @cardholder_verification_method.nil?
              hash['paymentCategory'] = @payment_category unless @payment_category.nil?
              hash['paymentMethodData'] = @payment_method_data.to_h unless @payment_method_data.nil?
              hash['pointOfSaleEntryMode'] = @point_of_sale_entry_mode unless @point_of_sale_entry_mode.nil?
              hash['transactionReferences'] = @transaction_references.to_h unless @transaction_references.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'cardholderVerificationMethod'
                @cardholder_verification_method = hash['cardholderVerificationMethod']
              end
              if hash.has_key? 'paymentCategory'
                @payment_category = hash['paymentCategory']
              end
              if hash.has_key? 'paymentMethodData'
                raise TypeError, "value '%s' is not a Hash" % [hash['paymentMethodData']] unless hash['paymentMethodData'].is_a? Hash
                @payment_method_data = Worldline::Acquiring::SDK::V1::Domain::PaymentMethodDataBase.new_from_hash(hash['paymentMethodData'])
              end
              if hash.has_key? 'pointOfSaleEntryMode'
                @point_of_sale_entry_mode = hash['pointOfSaleEntryMode']
              end
              if hash.has_key? 'transactionReferences'
                raise TypeError, "value '%s' is not a Hash" % [hash['transactionReferences']] unless hash['transactionReferences'].is_a? Hash
                @transaction_references = Worldline::Acquiring::SDK::V1::Domain::TransactionReferencesBase.new_from_hash(hash['transactionReferences'])
              end
            end
          end
        end
      end
    end
  end
end
