#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/v1/domain/merchant_id_item'
require 'worldline/acquiring/sdk/v1/domain/merchant_scope'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Array<Worldline::Acquiring::SDK::V1::Domain::MerchantIdItem>] merchant_ids
          class ByMerchantIds < Worldline::Acquiring::SDK::V1::Domain::MerchantScope

            MERCHANT_SCOPE_TYPE = 'BY_MERCHANT_IDS'.freeze

            undef_method :merchant_scope_type=

            attr_accessor :merchant_ids

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
              hash['merchantIds'] = @merchant_ids.collect{|val| val.to_h} unless @merchant_ids.nil?
              hash['merchantScopeType'] = MERCHANT_SCOPE_TYPE
              hash
            end

            def from_hash(hash)
              super
              @merchant_scope_type = MERCHANT_SCOPE_TYPE
              if hash.has_key? 'merchantIds'
                raise TypeError, "value '%s' is not an Array" % [hash['merchantIds']] unless hash['merchantIds'].is_a? Array
                @merchant_ids = []
                hash['merchantIds'].each do |e|
                  @merchant_ids << Worldline::Acquiring::SDK::V1::Domain::MerchantIdItem.new_from_hash(e)
                end
              end
            end
          end
        end
      end
    end
  end
end
