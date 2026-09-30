#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/v1/domain/pin_encryption_data'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Integer] key_generation
          # @attr [String] random_value
          class AesUkptPinEncryptionData < Worldline::Acquiring::SDK::V1::Domain::PinEncryptionData

            PIN_ENCRYPTION_TYPE = 'AES_UKPT'.freeze

            undef_method :pin_encryption_type=

            attr_accessor :key_generation

            attr_accessor :random_value

            def initialize
              super
              @pin_encryption_type = PIN_ENCRYPTION_TYPE
            end

            # @return [String]
            def pin_encryption_type
              PIN_ENCRYPTION_TYPE
            end

            # @return (Hash)
            def to_h
              hash = super
              hash['keyGeneration'] = @key_generation unless @key_generation.nil?
              hash['randomValue'] = @random_value unless @random_value.nil?
              hash['pinEncryptionType'] = PIN_ENCRYPTION_TYPE
              hash
            end

            def from_hash(hash)
              super
              @pin_encryption_type = PIN_ENCRYPTION_TYPE
              if hash.has_key? 'keyGeneration'
                @key_generation = hash['keyGeneration']
              end
              if hash.has_key? 'randomValue'
                @random_value = hash['randomValue']
              end
            end
          end
        end
      end
    end
  end
end
