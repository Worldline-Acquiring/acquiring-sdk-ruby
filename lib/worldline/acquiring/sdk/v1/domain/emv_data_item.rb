#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] tag
          # @attr [String] value
          class EmvDataItem < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :tag

            attr_accessor :value

            # @return (Hash)
            def to_h
              hash = super
              hash['tag'] = @tag unless @tag.nil?
              hash['value'] = @value unless @value.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'tag'
                @tag = hash['tag']
              end
              if hash.has_key? 'value'
                @value = hash['value']
              end
            end
          end
        end
      end
    end
  end
end
