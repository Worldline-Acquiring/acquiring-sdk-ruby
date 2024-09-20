#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Integer] amount
          # @attr [float] conversion_rate
          # @attr [String] currency_code
          # @attr [Integer] number_of_decimals
          class DccData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :amount

            attr_accessor :conversion_rate

            attr_accessor :currency_code

            attr_accessor :number_of_decimals

            # @return (Hash)
            def to_h
              hash = super
              hash['amount'] = @amount unless @amount.nil?
              hash['conversionRate'] = @conversion_rate unless @conversion_rate.nil?
              hash['currencyCode'] = @currency_code unless @currency_code.nil?
              hash['numberOfDecimals'] = @number_of_decimals unless @number_of_decimals.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'amount'
                @amount = hash['amount']
              end
              if hash.has_key? 'conversionRate'
                @conversion_rate = hash['conversionRate']
              end
              if hash.has_key? 'currencyCode'
                @currency_code = hash['currencyCode']
              end
              if hash.has_key? 'numberOfDecimals'
                @number_of_decimals = hash['numberOfDecimals']
              end
            end
          end
        end
      end
    end
  end
end
