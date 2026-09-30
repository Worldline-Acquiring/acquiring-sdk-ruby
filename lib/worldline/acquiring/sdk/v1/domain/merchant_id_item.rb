#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] acquirer_id
          # @attr [String] merchant_id
          class MerchantIdItem < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :acquirer_id

            attr_accessor :merchant_id

            # @return (Hash)
            def to_h
              hash = super
              hash['acquirerId'] = @acquirer_id unless @acquirer_id.nil?
              hash['merchantId'] = @merchant_id unless @merchant_id.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'acquirerId'
                @acquirer_id = hash['acquirerId']
              end
              if hash.has_key? 'merchantId'
                @merchant_id = hash['merchantId']
              end
            end
          end
        end
      end
    end
  end
end
