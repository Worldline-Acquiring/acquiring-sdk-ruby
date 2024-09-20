#
# This file was automatically generated.
#
require 'date'

require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [float] exchange_rate
          # @attr [float] inverted_exchange_rate
          # @attr [float] mark_up
          # @attr [String] mark_up_basis
          # @attr [DateTime] quotation_date_time
          class RateData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :exchange_rate

            attr_accessor :inverted_exchange_rate

            attr_accessor :mark_up

            attr_accessor :mark_up_basis

            attr_accessor :quotation_date_time

            # @return (Hash)
            def to_h
              hash = super
              hash['exchangeRate'] = @exchange_rate unless @exchange_rate.nil?
              hash['invertedExchangeRate'] = @inverted_exchange_rate unless @inverted_exchange_rate.nil?
              hash['markUp'] = @mark_up unless @mark_up.nil?
              hash['markUpBasis'] = @mark_up_basis unless @mark_up_basis.nil?
              hash['quotationDateTime'] = @quotation_date_time.iso8601(3) unless @quotation_date_time.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'exchangeRate'
                @exchange_rate = hash['exchangeRate']
              end
              if hash.has_key? 'invertedExchangeRate'
                @inverted_exchange_rate = hash['invertedExchangeRate']
              end
              if hash.has_key? 'markUp'
                @mark_up = hash['markUp']
              end
              if hash.has_key? 'markUpBasis'
                @mark_up_basis = hash['markUpBasis']
              end
              if hash.has_key? 'quotationDateTime'
                @quotation_date_time = DateTime.parse(hash['quotationDateTime'])
              end
            end
          end
        end
      end
    end
  end
end
