#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/v1/domain/transaction_references_base'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] acquirer_transaction_reference
          # @attr [String] merchant_operation_id
          # @attr [String] retrieval_reference_number
          # @attr [String] scheme_transaction_id
          # @attr [String] scheme_transaction_link_id
          # @attr [String] terminal_id
          # @attr [String] terminal_transaction_reference
          class TransactionReferencesDispute < Worldline::Acquiring::SDK::V1::Domain::TransactionReferencesBase

            attr_accessor :acquirer_transaction_reference

            attr_accessor :merchant_operation_id

            attr_accessor :retrieval_reference_number

            attr_accessor :scheme_transaction_id

            attr_accessor :scheme_transaction_link_id

            attr_accessor :terminal_id

            attr_accessor :terminal_transaction_reference

            # @return (Hash)
            def to_h
              hash = super
              hash['acquirerTransactionReference'] = @acquirer_transaction_reference unless @acquirer_transaction_reference.nil?
              hash['merchantOperationId'] = @merchant_operation_id unless @merchant_operation_id.nil?
              hash['retrievalReferenceNumber'] = @retrieval_reference_number unless @retrieval_reference_number.nil?
              hash['schemeTransactionId'] = @scheme_transaction_id unless @scheme_transaction_id.nil?
              hash['schemeTransactionLinkId'] = @scheme_transaction_link_id unless @scheme_transaction_link_id.nil?
              hash['terminalId'] = @terminal_id unless @terminal_id.nil?
              hash['terminalTransactionReference'] = @terminal_transaction_reference unless @terminal_transaction_reference.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'acquirerTransactionReference'
                @acquirer_transaction_reference = hash['acquirerTransactionReference']
              end
              if hash.has_key? 'merchantOperationId'
                @merchant_operation_id = hash['merchantOperationId']
              end
              if hash.has_key? 'retrievalReferenceNumber'
                @retrieval_reference_number = hash['retrievalReferenceNumber']
              end
              if hash.has_key? 'schemeTransactionId'
                @scheme_transaction_id = hash['schemeTransactionId']
              end
              if hash.has_key? 'schemeTransactionLinkId'
                @scheme_transaction_link_id = hash['schemeTransactionLinkId']
              end
              if hash.has_key? 'terminalId'
                @terminal_id = hash['terminalId']
              end
              if hash.has_key? 'terminalTransactionReference'
                @terminal_transaction_reference = hash['terminalTransactionReference']
              end
            end
          end
        end
      end
    end
  end
end
