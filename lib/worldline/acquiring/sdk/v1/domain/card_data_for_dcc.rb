#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] bin
          # @attr [String] brand
          # @attr [String] card_country_code
          # @attr [String] card_entry_mode
          class CardDataForDcc < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :bin

            attr_accessor :brand

            attr_accessor :card_country_code

            attr_accessor :card_entry_mode

            # @return (Hash)
            def to_h
              hash = super
              hash['bin'] = @bin unless @bin.nil?
              hash['brand'] = @brand unless @brand.nil?
              hash['cardCountryCode'] = @card_country_code unless @card_country_code.nil?
              hash['cardEntryMode'] = @card_entry_mode unless @card_entry_mode.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'bin'
                @bin = hash['bin']
              end
              if hash.has_key? 'brand'
                @brand = hash['brand']
              end
              if hash.has_key? 'cardCountryCode'
                @card_country_code = hash['cardCountryCode']
              end
              if hash.has_key? 'cardEntryMode'
                @card_entry_mode = hash['cardEntryMode']
              end
            end
          end
        end
      end
    end
  end
end
