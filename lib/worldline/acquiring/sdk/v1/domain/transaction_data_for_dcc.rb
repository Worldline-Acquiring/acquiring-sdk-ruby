#
# This file was automatically generated.
#
require 'date'

require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/amount_data'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Worldline::Acquiring::SDK::V1::Domain::AmountData] amount
          # @attr [DateTime] transaction_timestamp
          # @attr [String] transaction_type
          class TransactionDataForDcc < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :amount

            attr_accessor :transaction_timestamp

            attr_accessor :transaction_type

            # @return (Hash)
            def to_h
              hash = super
              hash['amount'] = @amount.to_h unless @amount.nil?
              hash['transactionTimestamp'] = @transaction_timestamp.iso8601(3) unless @transaction_timestamp.nil?
              hash['transactionType'] = @transaction_type unless @transaction_type.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'amount'
                raise TypeError, "value '%s' is not a Hash" % [hash['amount']] unless hash['amount'].is_a? Hash
                @amount = Worldline::Acquiring::SDK::V1::Domain::AmountData.new_from_hash(hash['amount'])
              end
              if hash.has_key? 'transactionTimestamp'
                @transaction_timestamp = DateTime.parse(hash['transactionTimestamp'])
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
