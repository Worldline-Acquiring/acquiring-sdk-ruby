#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] payment_account_reference
          # @attr [String] retrieval_reference_number
          # @attr [String] scheme_transaction_id
          class ApiReferencesForResponses < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :payment_account_reference

            attr_accessor :retrieval_reference_number

            attr_accessor :scheme_transaction_id

            # @return (Hash)
            def to_h
              hash = super
              hash['paymentAccountReference'] = @payment_account_reference unless @payment_account_reference.nil?
              hash['retrievalReferenceNumber'] = @retrieval_reference_number unless @retrieval_reference_number.nil?
              hash['schemeTransactionId'] = @scheme_transaction_id unless @scheme_transaction_id.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'paymentAccountReference'
                @payment_account_reference = hash['paymentAccountReference']
              end
              if hash.has_key? 'retrievalReferenceNumber'
                @retrieval_reference_number = hash['retrievalReferenceNumber']
              end
              if hash.has_key? 'schemeTransactionId'
                @scheme_transaction_id = hash['schemeTransactionId']
              end
            end
          end
        end
      end
    end
  end
end
