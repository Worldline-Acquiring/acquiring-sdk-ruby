#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] merchant_advice_code
          # @attr [String] merchant_advice_code_description
          class AdditionalResponseData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :merchant_advice_code

            attr_accessor :merchant_advice_code_description

            # @return (Hash)
            def to_h
              hash = super
              hash['merchantAdviceCode'] = @merchant_advice_code unless @merchant_advice_code.nil?
              hash['merchantAdviceCodeDescription'] = @merchant_advice_code_description unless @merchant_advice_code_description.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'merchantAdviceCode'
                @merchant_advice_code = hash['merchantAdviceCode']
              end
              if hash.has_key? 'merchantAdviceCodeDescription'
                @merchant_advice_code_description = hash['merchantAdviceCodeDescription']
              end
            end
          end
        end
      end
    end
  end
end
