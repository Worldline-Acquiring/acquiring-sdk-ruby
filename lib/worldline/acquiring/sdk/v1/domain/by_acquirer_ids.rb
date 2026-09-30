#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/v1/domain/merchant_scope'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Array<String>] acquirer_ids
          class ByAcquirerIds < Worldline::Acquiring::SDK::V1::Domain::MerchantScope

            MERCHANT_SCOPE_TYPE = 'BY_ACQUIRER_IDS'.freeze

            undef_method :merchant_scope_type=

            attr_accessor :acquirer_ids

            def initialize
              super
              @merchant_scope_type = MERCHANT_SCOPE_TYPE
            end

            # @return [String]
            def merchant_scope_type
              MERCHANT_SCOPE_TYPE
            end

            # @return (Hash)
            def to_h
              hash = super
              hash['acquirerIds'] = @acquirer_ids unless @acquirer_ids.nil?
              hash['merchantScopeType'] = MERCHANT_SCOPE_TYPE
              hash
            end

            def from_hash(hash)
              super
              @merchant_scope_type = MERCHANT_SCOPE_TYPE
              if hash.has_key? 'acquirerIds'
                raise TypeError, "value '%s' is not an Array" % [hash['acquirerIds']] unless hash['acquirerIds'].is_a? Array
                @acquirer_ids = []
                hash['acquirerIds'].each do |e|
                  @acquirer_ids << e
                end
              end
            end
          end
        end
      end
    end
  end
end
