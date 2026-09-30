#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] merchant_scope_type Possible values are: BY_ACQUIRER_IDS, BY_MERCHANT_ROOT_IDS, BY_MERCHANT_IDS. Read-only.
          class MerchantScope < Worldline::Acquiring::SDK::Domain::DataObject

            attr_reader :merchant_scope_type
            attr_writer :merchant_scope_type
            protected :merchant_scope_type=

            # @return (Hash)
            def to_h
              hash = super
              hash['merchantScopeType'] = merchant_scope_type unless merchant_scope_type.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'merchantScopeType'
                @merchant_scope_type = hash['merchantScopeType']
              end
            end
          end
        end
      end
    end
  end
end
