#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/v1/domain/pin_encryption_data'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] key_serial_number
          class DukptPinEncryptionData < Worldline::Acquiring::SDK::V1::Domain::PinEncryptionData

            PIN_ENCRYPTION_TYPE = 'DUKPT'.freeze

            undef_method :pin_encryption_type=

            attr_accessor :key_serial_number

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
              hash['keySerialNumber'] = @key_serial_number unless @key_serial_number.nil?
              hash['pinEncryptionType'] = PIN_ENCRYPTION_TYPE
              hash
            end

            def from_hash(hash)
              super
              @pin_encryption_type = PIN_ENCRYPTION_TYPE
              if hash.has_key? 'keySerialNumber'
                @key_serial_number = hash['keySerialNumber']
              end
            end
          end
        end
      end
    end
  end
end
