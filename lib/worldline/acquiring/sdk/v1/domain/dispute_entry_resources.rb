#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/dispute_entry_with_dispute_summary'
require 'worldline/acquiring/sdk/v1/domain/pagination_response'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Array<Worldline::Acquiring::SDK::V1::Domain::DisputeEntryWithDisputeSummary>] dispute_entries
          # @attr [Worldline::Acquiring::SDK::V1::Domain::PaginationResponse] pagination
          # @attr [String] request_id
          class DisputeEntryResources < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :dispute_entries

            attr_accessor :pagination

            attr_accessor :request_id

            # @return (Hash)
            def to_h
              hash = super
              hash['disputeEntries'] = @dispute_entries.collect{|val| val.to_h} unless @dispute_entries.nil?
              hash['pagination'] = @pagination.to_h unless @pagination.nil?
              hash['requestId'] = @request_id unless @request_id.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'disputeEntries'
                raise TypeError, "value '%s' is not an Array" % [hash['disputeEntries']] unless hash['disputeEntries'].is_a? Array
                @dispute_entries = []
                hash['disputeEntries'].each do |e|
                  @dispute_entries << Worldline::Acquiring::SDK::V1::Domain::DisputeEntryWithDisputeSummary.new_from_hash(e)
                end
              end
              if hash.has_key? 'pagination'
                raise TypeError, "value '%s' is not a Hash" % [hash['pagination']] unless hash['pagination'].is_a? Hash
                @pagination = Worldline::Acquiring::SDK::V1::Domain::PaginationResponse.new_from_hash(hash['pagination'])
              end
              if hash.has_key? 'requestId'
                @request_id = hash['requestId']
              end
            end
          end
        end
      end
    end
  end
end
