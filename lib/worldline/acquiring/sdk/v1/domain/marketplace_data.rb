#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] retailer_country_code
          # @attr [String] retailer_name
          class MarketplaceData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :retailer_country_code

            attr_accessor :retailer_name

            # @return (Hash)
            def to_h
              hash = super
              hash['retailerCountryCode'] = @retailer_country_code unless @retailer_country_code.nil?
              hash['retailerName'] = @retailer_name unless @retailer_name.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'retailerCountryCode'
                @retailer_country_code = hash['retailerCountryCode']
              end
              if hash.has_key? 'retailerName'
                @retailer_name = hash['retailerName']
              end
            end
          end
        end
      end
    end
  end
end
