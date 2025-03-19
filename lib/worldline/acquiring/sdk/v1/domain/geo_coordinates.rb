#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [float] latitude
          # @attr [float] longitude
          class GeoCoordinates < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :latitude

            attr_accessor :longitude

            # @return (Hash)
            def to_h
              hash = super
              hash['latitude'] = @latitude unless @latitude.nil?
              hash['longitude'] = @longitude unless @longitude.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'latitude'
                @latitude = hash['latitude']
              end
              if hash.has_key? 'longitude'
                @longitude = hash['longitude']
              end
            end
          end
        end
      end
    end
  end
end
