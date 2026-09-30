#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/dispute_case_with_entries'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Worldline::Acquiring::SDK::V1::Domain::DisputeCaseWithEntries] dispute
          # @attr [String] request_id
          class DisputeResponse < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :dispute

            attr_accessor :request_id

            # @return (Hash)
            def to_h
              hash = super
              hash['dispute'] = @dispute.to_h unless @dispute.nil?
              hash['requestId'] = @request_id unless @request_id.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'dispute'
                raise TypeError, "value '%s' is not a Hash" % [hash['dispute']] unless hash['dispute'].is_a? Hash
                @dispute = Worldline::Acquiring::SDK::V1::Domain::DisputeCaseWithEntries.new_from_hash(hash['dispute'])
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
