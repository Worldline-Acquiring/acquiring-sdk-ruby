#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/emv_data_item'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Array<Worldline::Acquiring::SDK::V1::Domain::EmvDataItem>] emv_data
          class CapturePointOfSaleData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :emv_data

            # @return (Hash)
            def to_h
              hash = super
              hash['emvData'] = @emv_data.collect{|val| val.to_h} unless @emv_data.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'emvData'
                raise TypeError, "value '%s' is not an Array" % [hash['emvData']] unless hash['emvData'].is_a? Array
                @emv_data = []
                hash['emvData'].each do |e|
                  @emv_data << Worldline::Acquiring::SDK::V1::Domain::EmvDataItem.new_from_hash(e)
                end
              end
            end
          end
        end
      end
    end
  end
end
