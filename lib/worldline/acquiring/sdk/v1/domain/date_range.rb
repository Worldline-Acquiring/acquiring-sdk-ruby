#
# This file was automatically generated.
#
require 'date'

require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Date] greater_equal
          # @attr [Date] lower_equal
          class DateRange < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :greater_equal

            attr_accessor :lower_equal

            # @return (Hash)
            def to_h
              hash = super
              hash['greaterEqual'] = @greater_equal.iso8601 unless @greater_equal.nil?
              hash['lowerEqual'] = @lower_equal.iso8601 unless @lower_equal.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'greaterEqual'
                @greater_equal = Date.parse(hash['greaterEqual'])
              end
              if hash.has_key? 'lowerEqual'
                @lower_equal = Date.parse(hash['lowerEqual'])
              end
            end
          end
        end
      end
    end
  end
end
