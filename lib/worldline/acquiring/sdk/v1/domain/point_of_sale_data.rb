#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] terminal_id
          class PointOfSaleData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :terminal_id

            # @return (Hash)
            def to_h
              hash = super
              hash['terminalId'] = @terminal_id unless @terminal_id.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'terminalId'
                @terminal_id = hash['terminalId']
              end
            end
          end
        end
      end
    end
  end
end
