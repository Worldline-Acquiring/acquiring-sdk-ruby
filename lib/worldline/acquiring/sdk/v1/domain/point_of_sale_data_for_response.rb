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
          # @attr [String] pan_last4_digits
          # @attr [Integer] pin_retry_counter
          class PointOfSaleDataForResponse < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :emv_data

            attr_accessor :pan_last4_digits

            attr_accessor :pin_retry_counter

            # @return (Hash)
            def to_h
              hash = super
              hash['emvData'] = @emv_data.collect{|val| val.to_h} unless @emv_data.nil?
              hash['panLast4Digits'] = @pan_last4_digits unless @pan_last4_digits.nil?
              hash['pinRetryCounter'] = @pin_retry_counter unless @pin_retry_counter.nil?
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
              if hash.has_key? 'panLast4Digits'
                @pan_last4_digits = hash['panLast4Digits']
              end
              if hash.has_key? 'pinRetryCounter'
                @pin_retry_counter = hash['pinRetryCounter']
              end
            end
          end
        end
      end
    end
  end
end
