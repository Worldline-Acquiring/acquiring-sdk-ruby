#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] cryptogram
          # @attr [String] eci
          class NetworkTokenData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :cryptogram

            attr_accessor :eci

            # @return (Hash)
            def to_h
              hash = super
              hash['cryptogram'] = @cryptogram unless @cryptogram.nil?
              hash['eci'] = @eci unless @eci.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'cryptogram'
                @cryptogram = hash['cryptogram']
              end
              if hash.has_key? 'eci'
                @eci = hash['eci']
              end
            end
          end
        end
      end
    end
  end
end
