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
          # @attr [String] encrypted_pin_block
          # @attr [true/false] is_response_to_pin_request
          # @attr [true/false] is_retry_with_the_same_operation_id
          # @attr [String] pin_master_key_reference
          # @attr [String] track2_data
          class PointOfSaleData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :emv_data

            attr_accessor :encrypted_pin_block

            attr_accessor :is_response_to_pin_request

            attr_accessor :is_retry_with_the_same_operation_id

            attr_accessor :pin_master_key_reference

            attr_accessor :track2_data

            # @return (Hash)
            def to_h
              hash = super
              hash['emvData'] = @emv_data.collect{|val| val.to_h} unless @emv_data.nil?
              hash['encryptedPinBlock'] = @encrypted_pin_block unless @encrypted_pin_block.nil?
              hash['isResponseToPinRequest'] = @is_response_to_pin_request unless @is_response_to_pin_request.nil?
              hash['isRetryWithTheSameOperationId'] = @is_retry_with_the_same_operation_id unless @is_retry_with_the_same_operation_id.nil?
              hash['pinMasterKeyReference'] = @pin_master_key_reference unless @pin_master_key_reference.nil?
              hash['track2Data'] = @track2_data unless @track2_data.nil?
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
              if hash.has_key? 'encryptedPinBlock'
                @encrypted_pin_block = hash['encryptedPinBlock']
              end
              if hash.has_key? 'isResponseToPinRequest'
                @is_response_to_pin_request = hash['isResponseToPinRequest']
              end
              if hash.has_key? 'isRetryWithTheSameOperationId'
                @is_retry_with_the_same_operation_id = hash['isRetryWithTheSameOperationId']
              end
              if hash.has_key? 'pinMasterKeyReference'
                @pin_master_key_reference = hash['pinMasterKeyReference']
              end
              if hash.has_key? 'track2Data'
                @track2_data = hash['track2Data']
              end
            end
          end
        end
      end
    end
  end
end
