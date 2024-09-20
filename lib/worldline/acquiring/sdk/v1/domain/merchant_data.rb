#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] address
          # @attr [String] city
          # @attr [String] country_code
          # @attr [Integer] merchant_category_code
          # @attr [String] name
          # @attr [String] postal_code
          # @attr [String] state_code
          class MerchantData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :address

            attr_accessor :city

            attr_accessor :country_code

            attr_accessor :merchant_category_code

            attr_accessor :name

            attr_accessor :postal_code

            attr_accessor :state_code

            # @return (Hash)
            def to_h
              hash = super
              hash['address'] = @address unless @address.nil?
              hash['city'] = @city unless @city.nil?
              hash['countryCode'] = @country_code unless @country_code.nil?
              hash['merchantCategoryCode'] = @merchant_category_code unless @merchant_category_code.nil?
              hash['name'] = @name unless @name.nil?
              hash['postalCode'] = @postal_code unless @postal_code.nil?
              hash['stateCode'] = @state_code unless @state_code.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'address'
                @address = hash['address']
              end
              if hash.has_key? 'city'
                @city = hash['city']
              end
              if hash.has_key? 'countryCode'
                @country_code = hash['countryCode']
              end
              if hash.has_key? 'merchantCategoryCode'
                @merchant_category_code = hash['merchantCategoryCode']
              end
              if hash.has_key? 'name'
                @name = hash['name']
              end
              if hash.has_key? 'postalCode'
                @postal_code = hash['postalCode']
              end
              if hash.has_key? 'stateCode'
                @state_code = hash['stateCode']
              end
            end
          end
        end
      end
    end
  end
end
