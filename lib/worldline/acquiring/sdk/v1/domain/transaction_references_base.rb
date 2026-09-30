#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] acquirer_reference_number
          # @attr [String] merchant_reference
          # @attr [String] payment_id
          class TransactionReferencesBase < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :acquirer_reference_number

            attr_accessor :merchant_reference

            attr_accessor :payment_id

            # @return (Hash)
            def to_h
              hash = super
              hash['acquirerReferenceNumber'] = @acquirer_reference_number unless @acquirer_reference_number.nil?
              hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
              hash['paymentId'] = @payment_id unless @payment_id.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'acquirerReferenceNumber'
                @acquirer_reference_number = hash['acquirerReferenceNumber']
              end
              if hash.has_key? 'merchantReference'
                @merchant_reference = hash['merchantReference']
              end
              if hash.has_key? 'paymentId'
                @payment_id = hash['paymentId']
              end
            end
          end
        end
      end
    end
  end
end
