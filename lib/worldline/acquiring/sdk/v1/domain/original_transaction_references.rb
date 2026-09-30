#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] original_scheme_transaction_id
          # @attr [String] original_scheme_transaction_link_id
          class OriginalTransactionReferences < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :original_scheme_transaction_id

            attr_accessor :original_scheme_transaction_link_id

            # @return (Hash)
            def to_h
              hash = super
              hash['originalSchemeTransactionId'] = @original_scheme_transaction_id unless @original_scheme_transaction_id.nil?
              hash['originalSchemeTransactionLinkId'] = @original_scheme_transaction_link_id unless @original_scheme_transaction_link_id.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'originalSchemeTransactionId'
                @original_scheme_transaction_id = hash['originalSchemeTransactionId']
              end
              if hash.has_key? 'originalSchemeTransactionLinkId'
                @original_scheme_transaction_link_id = hash['originalSchemeTransactionLinkId']
              end
            end
          end
        end
      end
    end
  end
end
