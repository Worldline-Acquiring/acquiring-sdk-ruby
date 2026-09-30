#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] greater
          # @attr [String] greater_equal
          # @attr [String] lower
          # @attr [String] lower_equal
          class DateTimeRange < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :greater

            attr_accessor :greater_equal

            attr_accessor :lower

            attr_accessor :lower_equal

            # @return (Hash)
            def to_h
              hash = super
              hash['greater'] = @greater unless @greater.nil?
              hash['greaterEqual'] = @greater_equal unless @greater_equal.nil?
              hash['lower'] = @lower unless @lower.nil?
              hash['lowerEqual'] = @lower_equal unless @lower_equal.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'greater'
                @greater = hash['greater']
              end
              if hash.has_key? 'greaterEqual'
                @greater_equal = hash['greaterEqual']
              end
              if hash.has_key? 'lower'
                @lower = hash['lower']
              end
              if hash.has_key? 'lowerEqual'
                @lower_equal = hash['lowerEqual']
              end
            end
          end
        end
      end
    end
  end
end
