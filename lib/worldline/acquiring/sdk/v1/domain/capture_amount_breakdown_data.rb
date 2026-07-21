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
          # @attr [Worldline::Acquiring::SDK::V1::Domain::AmountData] tip_amount
          class CaptureAmountBreakdownData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :tip_amount

            # @return (Hash)
            def to_h
              hash = super
              hash['tipAmount'] = @tip_amount.to_h unless @tip_amount.nil?
              hash
            end

            def from_hash(hash)
              super
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
