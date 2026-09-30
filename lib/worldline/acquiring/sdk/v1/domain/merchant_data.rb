#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/customer_service_data'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] address
          # @attr [String] city
          # @attr [String] country_code
          # @attr [Worldline::Acquiring::SDK::V1::Domain::CustomerServiceData] customer_service_data
          # @attr [Integer] merchant_category_code
          # @attr [String] name
          # @attr [String] payment_facilitator_id
          # @attr [String] postal_code
          # @attr [String] state_code
          # @attr [String] sub_merchant_id
          # @attr [String] tax_id
          class MerchantData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :address

            attr_accessor :city

            attr_accessor :country_code

            attr_accessor :customer_service_data

            attr_accessor :merchant_category_code

            attr_accessor :name

            attr_accessor :payment_facilitator_id

            attr_accessor :postal_code

            attr_accessor :state_code

            attr_accessor :sub_merchant_id

            attr_accessor :tax_id

            # @return (Hash)
            def to_h
              hash = super
              hash['address'] = @address unless @address.nil?
              hash['city'] = @city unless @city.nil?
              hash['countryCode'] = @country_code unless @country_code.nil?
              hash['customerServiceData'] = @customer_service_data.to_h unless @customer_service_data.nil?
              hash['merchantCategoryCode'] = @merchant_category_code unless @merchant_category_code.nil?
              hash['name'] = @name unless @name.nil?
              hash['paymentFacilitatorId'] = @payment_facilitator_id unless @payment_facilitator_id.nil?
              hash['postalCode'] = @postal_code unless @postal_code.nil?
              hash['stateCode'] = @state_code unless @state_code.nil?
              hash['subMerchantId'] = @sub_merchant_id unless @sub_merchant_id.nil?
              hash['taxId'] = @tax_id unless @tax_id.nil?
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
              if hash.has_key? 'customerServiceData'
                raise TypeError, "value '%s' is not a Hash" % [hash['customerServiceData']] unless hash['customerServiceData'].is_a? Hash
                @customer_service_data = Worldline::Acquiring::SDK::V1::Domain::CustomerServiceData.new_from_hash(hash['customerServiceData'])
              end
              if hash.has_key? 'merchantCategoryCode'
                @merchant_category_code = hash['merchantCategoryCode']
              end
              if hash.has_key? 'name'
                @name = hash['name']
              end
              if hash.has_key? 'paymentFacilitatorId'
                @payment_facilitator_id = hash['paymentFacilitatorId']
              end
              if hash.has_key? 'postalCode'
                @postal_code = hash['postalCode']
              end
              if hash.has_key? 'stateCode'
                @state_code = hash['stateCode']
              end
              if hash.has_key? 'subMerchantId'
                @sub_merchant_id = hash['subMerchantId']
              end
              if hash.has_key? 'taxId'
                @tax_id = hash['taxId']
              end
            end
          end
        end
      end
    end
  end
end
