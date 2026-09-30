#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/v1/domain/dispute_case'
require 'worldline/acquiring/sdk/v1/domain/dispute_entry'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Array<Worldline::Acquiring::SDK::V1::Domain::DisputeEntry>] entries
          class DisputeCaseWithEntries < Worldline::Acquiring::SDK::V1::Domain::DisputeCase

            attr_accessor :entries

            # @return (Hash)
            def to_h
              hash = super
              hash['entries'] = @entries.collect{|val| val.to_h} unless @entries.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'entries'
                raise TypeError, "value '%s' is not an Array" % [hash['entries']] unless hash['entries'].is_a? Array
                @entries = []
                hash['entries'].each do |e|
                  @entries << Worldline::Acquiring::SDK::V1::Domain::DisputeEntry.new_from_hash(e)
                end
              end
            end
          end
        end
      end
    end
  end
end
