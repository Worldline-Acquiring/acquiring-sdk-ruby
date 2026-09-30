#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/v1/domain/pin_encryption_data'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] zone_pin_key_id
          class ZpkPinEncryptionData < Worldline::Acquiring::SDK::V1::Domain::PinEncryptionData

            PIN_ENCRYPTION_TYPE = 'ZPK'.freeze

            undef_method :pin_encryption_type=

            attr_accessor :zone_pin_key_id

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
              hash['zonePinKeyId'] = @zone_pin_key_id unless @zone_pin_key_id.nil?
              hash['pinEncryptionType'] = PIN_ENCRYPTION_TYPE
              hash
            end

            def from_hash(hash)
              super
              @pin_encryption_type = PIN_ENCRYPTION_TYPE
              if hash.has_key? 'zonePinKeyId'
                @zone_pin_key_id = hash['zonePinKeyId']
              end
            end
          end
        end
      end
    end
  end
end
