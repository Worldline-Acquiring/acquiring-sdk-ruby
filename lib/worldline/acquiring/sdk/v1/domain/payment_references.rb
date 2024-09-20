#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] dynamic_descriptor
          # @attr [String] merchant_reference
          # @attr [String] retrieval_reference_number
          class PaymentReferences < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :dynamic_descriptor

            attr_accessor :merchant_reference

            attr_accessor :retrieval_reference_number

            # @return (Hash)
            def to_h
              hash = super
              hash['dynamicDescriptor'] = @dynamic_descriptor unless @dynamic_descriptor.nil?
              hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
              hash['retrievalReferenceNumber'] = @retrieval_reference_number unless @retrieval_reference_number.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'dynamicDescriptor'
                @dynamic_descriptor = hash['dynamicDescriptor']
              end
              if hash.has_key? 'merchantReference'
                @merchant_reference = hash['merchantReference']
              end
              if hash.has_key? 'retrievalReferenceNumber'
                @retrieval_reference_number = hash['retrievalReferenceNumber']
              end
            end
          end
        end
      end
    end
  end
end
