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
          # @attr [String] currency_code
          # @attr [String] debit_credit_indicator
          # @attr [Integer] number_of_decimals
          class SignedAmountData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :amount

            attr_accessor :currency_code

            attr_accessor :debit_credit_indicator

            attr_accessor :number_of_decimals

            # @return (Hash)
            def to_h
              hash = super
              hash['amount'] = @amount unless @amount.nil?
              hash['currencyCode'] = @currency_code unless @currency_code.nil?
              hash['debitCreditIndicator'] = @debit_credit_indicator unless @debit_credit_indicator.nil?
              hash['numberOfDecimals'] = @number_of_decimals unless @number_of_decimals.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'amount'
                @amount = hash['amount']
              end
              if hash.has_key? 'currencyCode'
                @currency_code = hash['currencyCode']
              end
              if hash.has_key? 'debitCreditIndicator'
                @debit_credit_indicator = hash['debitCreditIndicator']
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
