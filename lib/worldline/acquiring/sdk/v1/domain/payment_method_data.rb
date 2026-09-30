#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/v1/domain/payment_method_data_base'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] issuing_country_code
          class PaymentMethodData < Worldline::Acquiring::SDK::V1::Domain::PaymentMethodDataBase

            attr_accessor :issuing_country_code

            # @return (Hash)
            def to_h
              hash = super
              hash['issuingCountryCode'] = @issuing_country_code unless @issuing_country_code.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'issuingCountryCode'
                @issuing_country_code = hash['issuingCountryCode']
              end
            end
          end
        end
      end
    end
  end
end
