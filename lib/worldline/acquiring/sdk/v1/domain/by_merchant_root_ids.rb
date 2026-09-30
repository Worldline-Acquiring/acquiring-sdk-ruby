#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/v1/domain/merchant_root_id_item'
require 'worldline/acquiring/sdk/v1/domain/merchant_scope'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Array<Worldline::Acquiring::SDK::V1::Domain::MerchantRootIdItem>] merchant_root_ids
          class ByMerchantRootIds < Worldline::Acquiring::SDK::V1::Domain::MerchantScope

            MERCHANT_SCOPE_TYPE = 'BY_MERCHANT_ROOT_IDS'.freeze

            undef_method :merchant_scope_type=

            attr_accessor :merchant_root_ids

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
              hash['merchantRootIds'] = @merchant_root_ids.collect{|val| val.to_h} unless @merchant_root_ids.nil?
              hash['merchantScopeType'] = MERCHANT_SCOPE_TYPE
              hash
            end

            def from_hash(hash)
              super
              @merchant_scope_type = MERCHANT_SCOPE_TYPE
              if hash.has_key? 'merchantRootIds'
                raise TypeError, "value '%s' is not an Array" % [hash['merchantRootIds']] unless hash['merchantRootIds'].is_a? Array
                @merchant_root_ids = []
                hash['merchantRootIds'].each do |e|
                  @merchant_root_ids << Worldline::Acquiring::SDK::V1::Domain::MerchantRootIdItem.new_from_hash(e)
                end
              end
            end
          end
        end
      end
    end
  end
end
