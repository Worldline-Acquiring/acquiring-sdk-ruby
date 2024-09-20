#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] future_use
          # @attr [String] transaction_type
          class InitialCardOnFileData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :future_use

            attr_accessor :transaction_type

            # @return (Hash)
            def to_h
              hash = super
              hash['futureUse'] = @future_use unless @future_use.nil?
              hash['transactionType'] = @transaction_type unless @transaction_type.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'futureUse'
                @future_use = hash['futureUse']
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
