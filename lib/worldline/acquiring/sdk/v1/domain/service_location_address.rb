#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] city
          # @attr [String] country_code
          # @attr [String] country_subdivision_code
          # @attr [String] postal_code
          class ServiceLocationAddress < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :city

            attr_accessor :country_code

            attr_accessor :country_subdivision_code

            attr_accessor :postal_code

            # @return (Hash)
            def to_h
              hash = super
              hash['city'] = @city unless @city.nil?
              hash['countryCode'] = @country_code unless @country_code.nil?
              hash['countrySubdivisionCode'] = @country_subdivision_code unless @country_subdivision_code.nil?
              hash['postalCode'] = @postal_code unless @postal_code.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'city'
                @city = hash['city']
              end
              if hash.has_key? 'countryCode'
                @country_code = hash['countryCode']
              end
              if hash.has_key? 'countrySubdivisionCode'
                @country_subdivision_code = hash['countrySubdivisionCode']
              end
              if hash.has_key? 'postalCode'
                @postal_code = hash['postalCode']
              end
            end
          end
        end
      end
    end
  end
end
