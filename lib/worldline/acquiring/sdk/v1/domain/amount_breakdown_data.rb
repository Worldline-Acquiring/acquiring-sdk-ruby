#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/amount_data'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Worldline::Acquiring::SDK::V1::Domain::AmountData] cashback_amount
          # @attr [Worldline::Acquiring::SDK::V1::Domain::AmountData] tip_amount
          class AmountBreakdownData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :cashback_amount

            attr_accessor :tip_amount

            # @return (Hash)
            def to_h
              hash = super
              hash['cashbackAmount'] = @cashback_amount.to_h unless @cashback_amount.nil?
              hash['tipAmount'] = @tip_amount.to_h unless @tip_amount.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'cashbackAmount'
                raise TypeError, "value '%s' is not a Hash" % [hash['cashbackAmount']] unless hash['cashbackAmount'].is_a? Hash
                @cashback_amount = Worldline::Acquiring::SDK::V1::Domain::AmountData.new_from_hash(hash['cashbackAmount'])
              end
              if hash.has_key? 'tipAmount'
                raise TypeError, "value '%s' is not a Hash" % [hash['tipAmount']] unless hash['tipAmount'].is_a? Hash
                @tip_amount = Worldline::Acquiring::SDK::V1::Domain::AmountData.new_from_hash(hash['tipAmount'])
              end
            end
          end
        end
      end
    end
  end
end
