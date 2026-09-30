#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/v1/domain/dispute_entry'
require 'worldline/acquiring/sdk/v1/domain/dispute_summary'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] dispute_id
          # @attr [Worldline::Acquiring::SDK::V1::Domain::DisputeSummary] dispute_summary
          class DisputeEntryWithDisputeSummary < Worldline::Acquiring::SDK::V1::Domain::DisputeEntry

            attr_accessor :dispute_id

            attr_accessor :dispute_summary

            # @return (Hash)
            def to_h
              hash = super
              hash['disputeId'] = @dispute_id unless @dispute_id.nil?
              hash['disputeSummary'] = @dispute_summary.to_h unless @dispute_summary.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'disputeId'
                @dispute_id = hash['disputeId']
              end
              if hash.has_key? 'disputeSummary'
                raise TypeError, "value '%s' is not a Hash" % [hash['disputeSummary']] unless hash['disputeSummary'].is_a? Hash
                @dispute_summary = Worldline::Acquiring::SDK::V1::Domain::DisputeSummary.new_from_hash(hash['disputeSummary'])
              end
            end
          end
        end
      end
    end
  end
end
