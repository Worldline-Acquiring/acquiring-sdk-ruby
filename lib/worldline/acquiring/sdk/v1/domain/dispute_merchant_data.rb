#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/v1/domain/dispute_merchant_data_base'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Integer] merchant_category_code
          # @attr [String] merchant_city
          # @attr [String] merchant_country_code
          # @attr [String] merchant_name
          class DisputeMerchantData < Worldline::Acquiring::SDK::V1::Domain::DisputeMerchantDataBase

            attr_accessor :merchant_category_code

            attr_accessor :merchant_city

            attr_accessor :merchant_country_code

            attr_accessor :merchant_name

            # @return (Hash)
            def to_h
              hash = super
              hash['merchantCategoryCode'] = @merchant_category_code unless @merchant_category_code.nil?
              hash['merchantCity'] = @merchant_city unless @merchant_city.nil?
              hash['merchantCountryCode'] = @merchant_country_code unless @merchant_country_code.nil?
              hash['merchantName'] = @merchant_name unless @merchant_name.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'merchantCategoryCode'
                @merchant_category_code = hash['merchantCategoryCode']
              end
              if hash.has_key? 'merchantCity'
                @merchant_city = hash['merchantCity']
              end
              if hash.has_key? 'merchantCountryCode'
                @merchant_country_code = hash['merchantCountryCode']
              end
              if hash.has_key? 'merchantName'
                @merchant_name = hash['merchantName']
              end
            end
          end
        end
      end
    end
  end
end
