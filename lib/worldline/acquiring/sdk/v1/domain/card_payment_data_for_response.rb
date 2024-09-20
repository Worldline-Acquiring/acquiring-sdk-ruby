#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/e_commerce_data_for_response'
require 'worldline/acquiring/sdk/v1/domain/point_of_sale_data'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] brand
          # @attr [Worldline::Acquiring::SDK::V1::Domain::ECommerceDataForResponse] ecommerce_data
          # @attr [Worldline::Acquiring::SDK::V1::Domain::PointOfSaleData] point_of_sale_data
          class CardPaymentDataForResponse < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :brand

            attr_accessor :ecommerce_data

            attr_accessor :point_of_sale_data

            # @return (Hash)
            def to_h
              hash = super
              hash['brand'] = @brand unless @brand.nil?
              hash['ecommerceData'] = @ecommerce_data.to_h unless @ecommerce_data.nil?
              hash['pointOfSaleData'] = @point_of_sale_data.to_h unless @point_of_sale_data.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'brand'
                @brand = hash['brand']
              end
              if hash.has_key? 'ecommerceData'
                raise TypeError, "value '%s' is not a Hash" % [hash['ecommerceData']] unless hash['ecommerceData'].is_a? Hash
                @ecommerce_data = Worldline::Acquiring::SDK::V1::Domain::ECommerceDataForResponse.new_from_hash(hash['ecommerceData'])
              end
              if hash.has_key? 'pointOfSaleData'
                raise TypeError, "value '%s' is not a Hash" % [hash['pointOfSaleData']] unless hash['pointOfSaleData'].is_a? Hash
                @point_of_sale_data = Worldline::Acquiring::SDK::V1::Domain::PointOfSaleData.new_from_hash(hash['pointOfSaleData'])
              end
            end
          end
        end
      end
    end
  end
end
