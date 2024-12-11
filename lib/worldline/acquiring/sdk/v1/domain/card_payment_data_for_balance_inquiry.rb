#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/e_commerce_data'
require 'worldline/acquiring/sdk/v1/domain/plain_card_data'
require 'worldline/acquiring/sdk/v1/domain/point_of_sale_data'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] brand
          # @attr [String] brand_selector
          # @attr [Worldline::Acquiring::SDK::V1::Domain::PlainCardData] card_data
          # @attr [String] card_entry_mode
          # @attr [String] cardholder_verification_method
          # @attr [Worldline::Acquiring::SDK::V1::Domain::ECommerceData] ecommerce_data
          # @attr [Worldline::Acquiring::SDK::V1::Domain::PointOfSaleData] point_of_sale_data
          # @attr [String] wallet_id
          class CardPaymentDataForBalanceInquiry < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :brand

            attr_accessor :brand_selector

            attr_accessor :card_data

            attr_accessor :card_entry_mode

            attr_accessor :cardholder_verification_method

            attr_accessor :ecommerce_data

            attr_accessor :point_of_sale_data

            attr_accessor :wallet_id

            # @return (Hash)
            def to_h
              hash = super
              hash['brand'] = @brand unless @brand.nil?
              hash['brandSelector'] = @brand_selector unless @brand_selector.nil?
              hash['cardData'] = @card_data.to_h unless @card_data.nil?
              hash['cardEntryMode'] = @card_entry_mode unless @card_entry_mode.nil?
              hash['cardholderVerificationMethod'] = @cardholder_verification_method unless @cardholder_verification_method.nil?
              hash['ecommerceData'] = @ecommerce_data.to_h unless @ecommerce_data.nil?
              hash['pointOfSaleData'] = @point_of_sale_data.to_h unless @point_of_sale_data.nil?
              hash['walletId'] = @wallet_id unless @wallet_id.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'brand'
                @brand = hash['brand']
              end
              if hash.has_key? 'brandSelector'
                @brand_selector = hash['brandSelector']
              end
              if hash.has_key? 'cardData'
                raise TypeError, "value '%s' is not a Hash" % [hash['cardData']] unless hash['cardData'].is_a? Hash
                @card_data = Worldline::Acquiring::SDK::V1::Domain::PlainCardData.new_from_hash(hash['cardData'])
              end
              if hash.has_key? 'cardEntryMode'
                @card_entry_mode = hash['cardEntryMode']
              end
              if hash.has_key? 'cardholderVerificationMethod'
                @cardholder_verification_method = hash['cardholderVerificationMethod']
              end
              if hash.has_key? 'ecommerceData'
                raise TypeError, "value '%s' is not a Hash" % [hash['ecommerceData']] unless hash['ecommerceData'].is_a? Hash
                @ecommerce_data = Worldline::Acquiring::SDK::V1::Domain::ECommerceData.new_from_hash(hash['ecommerceData'])
              end
              if hash.has_key? 'pointOfSaleData'
                raise TypeError, "value '%s' is not a Hash" % [hash['pointOfSaleData']] unless hash['pointOfSaleData'].is_a? Hash
                @point_of_sale_data = Worldline::Acquiring::SDK::V1::Domain::PointOfSaleData.new_from_hash(hash['pointOfSaleData'])
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
