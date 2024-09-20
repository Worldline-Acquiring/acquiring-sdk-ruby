#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] terminal_country_code
          # @attr [String] terminal_id
          class PointOfSaleDataForDcc < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :terminal_country_code

            attr_accessor :terminal_id

            # @return (Hash)
            def to_h
              hash = super
              hash['terminalCountryCode'] = @terminal_country_code unless @terminal_country_code.nil?
              hash['terminalId'] = @terminal_id unless @terminal_id.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'terminalCountryCode'
                @terminal_country_code = hash['terminalCountryCode']
              end
              if hash.has_key? 'terminalId'
                @terminal_id = hash['terminalId']
              end
            end
          end
        end
      end
    end
  end
end
