#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/geo_coordinates'
require 'worldline/acquiring/sdk/v1/domain/service_location_address'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Worldline::Acquiring::SDK::V1::Domain::ServiceLocationAddress] address
          # @attr [Worldline::Acquiring::SDK::V1::Domain::GeoCoordinates] geo_coordinates
          class ServiceLocationData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :address

            attr_accessor :geo_coordinates

            # @return (Hash)
            def to_h
              hash = super
              hash['address'] = @address.to_h unless @address.nil?
              hash['geoCoordinates'] = @geo_coordinates.to_h unless @geo_coordinates.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'address'
                raise TypeError, "value '%s' is not a Hash" % [hash['address']] unless hash['address'].is_a? Hash
                @address = Worldline::Acquiring::SDK::V1::Domain::ServiceLocationAddress.new_from_hash(hash['address'])
              end
              if hash.has_key? 'geoCoordinates'
                raise TypeError, "value '%s' is not a Hash" % [hash['geoCoordinates']] unless hash['geoCoordinates'].is_a? Hash
                @geo_coordinates = Worldline::Acquiring::SDK::V1::Domain::GeoCoordinates.new_from_hash(hash['geoCoordinates'])
              end
            end
          end
        end
      end
    end
  end
end
