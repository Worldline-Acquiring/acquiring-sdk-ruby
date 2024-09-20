#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/card_on_file_data'
require 'worldline/acquiring/sdk/v1/domain/e_commerce_data_for_account_verification'
require 'worldline/acquiring/sdk/v1/domain/network_token_data'
require 'worldline/acquiring/sdk/v1/domain/plain_card_data'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] brand
          # @attr [Worldline::Acquiring::SDK::V1::Domain::PlainCardData] card_data
          # @attr [String] card_entry_mode
          # @attr [Worldline::Acquiring::SDK::V1::Domain::CardOnFileData] card_on_file_data
          # @attr [String] cardholder_verification_method
          # @attr [Worldline::Acquiring::SDK::V1::Domain::ECommerceDataForAccountVerification] ecommerce_data
          # @attr [Worldline::Acquiring::SDK::V1::Domain::NetworkTokenData] network_token_data
          # @attr [String] wallet_id
          class CardPaymentDataForVerification < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :brand

            attr_accessor :card_data

            attr_accessor :card_entry_mode

            attr_accessor :card_on_file_data

            attr_accessor :cardholder_verification_method

            attr_accessor :ecommerce_data

            attr_accessor :network_token_data

            attr_accessor :wallet_id

            # @return (Hash)
            def to_h
              hash = super
              hash['brand'] = @brand unless @brand.nil?
              hash['cardData'] = @card_data.to_h unless @card_data.nil?
              hash['cardEntryMode'] = @card_entry_mode unless @card_entry_mode.nil?
              hash['cardOnFileData'] = @card_on_file_data.to_h unless @card_on_file_data.nil?
              hash['cardholderVerificationMethod'] = @cardholder_verification_method unless @cardholder_verification_method.nil?
              hash['ecommerceData'] = @ecommerce_data.to_h unless @ecommerce_data.nil?
              hash['networkTokenData'] = @network_token_data.to_h unless @network_token_data.nil?
              hash['walletId'] = @wallet_id unless @wallet_id.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'brand'
                @brand = hash['brand']
              end
              if hash.has_key? 'cardData'
                raise TypeError, "value '%s' is not a Hash" % [hash['cardData']] unless hash['cardData'].is_a? Hash
                @card_data = Worldline::Acquiring::SDK::V1::Domain::PlainCardData.new_from_hash(hash['cardData'])
              end
              if hash.has_key? 'cardEntryMode'
                @card_entry_mode = hash['cardEntryMode']
              end
              if hash.has_key? 'cardOnFileData'
                raise TypeError, "value '%s' is not a Hash" % [hash['cardOnFileData']] unless hash['cardOnFileData'].is_a? Hash
                @card_on_file_data = Worldline::Acquiring::SDK::V1::Domain::CardOnFileData.new_from_hash(hash['cardOnFileData'])
              end
              if hash.has_key? 'cardholderVerificationMethod'
                @cardholder_verification_method = hash['cardholderVerificationMethod']
              end
              if hash.has_key? 'ecommerceData'
                raise TypeError, "value '%s' is not a Hash" % [hash['ecommerceData']] unless hash['ecommerceData'].is_a? Hash
                @ecommerce_data = Worldline::Acquiring::SDK::V1::Domain::ECommerceDataForAccountVerification.new_from_hash(hash['ecommerceData'])
              end
              if hash.has_key? 'networkTokenData'
                raise TypeError, "value '%s' is not a Hash" % [hash['networkTokenData']] unless hash['networkTokenData'].is_a? Hash
                @network_token_data = Worldline::Acquiring::SDK::V1::Domain::NetworkTokenData.new_from_hash(hash['networkTokenData'])
              end
              if hash.has_key? 'walletId'
                @wallet_id = hash['walletId']
              end
            end
          end
        end
      end
    end
  end
end
