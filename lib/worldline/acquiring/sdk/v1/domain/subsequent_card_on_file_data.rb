#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] card_on_file_initiator
          # @attr [String] initial_scheme_transaction_id
          # @attr [String] transaction_type
          class SubsequentCardOnFileData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :card_on_file_initiator

            attr_accessor :initial_scheme_transaction_id

            attr_accessor :transaction_type

            # @return (Hash)
            def to_h
              hash = super
              hash['cardOnFileInitiator'] = @card_on_file_initiator unless @card_on_file_initiator.nil?
              hash['initialSchemeTransactionId'] = @initial_scheme_transaction_id unless @initial_scheme_transaction_id.nil?
              hash['transactionType'] = @transaction_type unless @transaction_type.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'cardOnFileInitiator'
                @card_on_file_initiator = hash['cardOnFileInitiator']
              end
              if hash.has_key? 'initialSchemeTransactionId'
                @initial_scheme_transaction_id = hash['initialSchemeTransactionId']
              end
              if hash.has_key? 'transactionType'
                @transaction_type = hash['transactionType']
              end
            end
          end
        end
      end
    end
  end
end
