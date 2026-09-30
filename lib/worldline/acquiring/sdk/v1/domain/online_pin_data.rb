#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/pin_encryption_data'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] encrypted_pin_block
          # @attr [Integer] pin_block_format
          # @attr [Worldline::Acquiring::SDK::V1::Domain::PinEncryptionData] pin_encryption_data
          class OnlinePinData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :encrypted_pin_block

            attr_accessor :pin_block_format

            attr_accessor :pin_encryption_data

            # @return (Hash)
            def to_h
              hash = super
              hash['encryptedPinBlock'] = @encrypted_pin_block unless @encrypted_pin_block.nil?
              hash['pinBlockFormat'] = @pin_block_format unless @pin_block_format.nil?
              hash['pinEncryptionData'] = @pin_encryption_data.to_h unless @pin_encryption_data.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'encryptedPinBlock'
                @encrypted_pin_block = hash['encryptedPinBlock']
              end
              if hash.has_key? 'pinBlockFormat'
                @pin_block_format = hash['pinBlockFormat']
              end
              if hash.has_key? 'pinEncryptionData'
                raise TypeError, "value '%s' is not a Hash" % [hash['pinEncryptionData']] unless hash['pinEncryptionData'].is_a? Hash
                @pin_encryption_data = Worldline::Acquiring::SDK::V1::Domain::PinEncryptionData.new_from_hash(hash['pinEncryptionData'])
              end
            end
          end
        end
      end
    end
  end
end
