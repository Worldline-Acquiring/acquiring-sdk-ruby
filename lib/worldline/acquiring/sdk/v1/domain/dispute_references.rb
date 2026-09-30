#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] acquirer_dispute_reference
          # @attr [String] scheme_dispute_reference
          class DisputeReferences < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :acquirer_dispute_reference

            attr_accessor :scheme_dispute_reference

            # @return (Hash)
            def to_h
              hash = super
              hash['acquirerDisputeReference'] = @acquirer_dispute_reference unless @acquirer_dispute_reference.nil?
              hash['schemeDisputeReference'] = @scheme_dispute_reference unless @scheme_dispute_reference.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'acquirerDisputeReference'
                @acquirer_dispute_reference = hash['acquirerDisputeReference']
              end
              if hash.has_key? 'schemeDisputeReference'
                @scheme_dispute_reference = hash['schemeDisputeReference']
              end
            end
          end
        end
      end
    end
  end
end
