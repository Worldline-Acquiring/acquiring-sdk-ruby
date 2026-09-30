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
          # @attr [String] merchant_root_id
          class DisputeMerchantDataBase < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :acquirer_id

            attr_accessor :merchant_id

            attr_accessor :merchant_root_id

            # @return (Hash)
            def to_h
              hash = super
              hash['acquirerId'] = @acquirer_id unless @acquirer_id.nil?
              hash['merchantId'] = @merchant_id unless @merchant_id.nil?
              hash['merchantRootId'] = @merchant_root_id unless @merchant_root_id.nil?
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
              if hash.has_key? 'merchantRootId'
                @merchant_root_id = hash['merchantRootId']
              end
            end
          end
        end
      end
    end
  end
end
