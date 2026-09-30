#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] pin_encryption_type Possible values are: AES_UKPT, DUKPT, ZPK. Read-only.
          class PinEncryptionData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_reader :pin_encryption_type
            attr_writer :pin_encryption_type
            protected :pin_encryption_type=

            # @return (Hash)
            def to_h
              hash = super
              hash['pinEncryptionType'] = pin_encryption_type unless pin_encryption_type.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'pinEncryptionType'
                @pin_encryption_type = hash['pinEncryptionType']
              end
            end
          end
        end
      end
    end
  end
end
