#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/api_resource'
require 'worldline/acquiring/sdk/v1/acquirer/merchant/accountverifications/account_verifications_client'
require 'worldline/acquiring/sdk/v1/acquirer/merchant/balanceinquiries/balance_inquiries_client'
require 'worldline/acquiring/sdk/v1/acquirer/merchant/cardpayments/card_payments_client'
require 'worldline/acquiring/sdk/v1/acquirer/merchant/cardrefunds/card_refunds_client'
require 'worldline/acquiring/sdk/v1/acquirer/merchant/dynamiccurrencyconversion/dynamic_currency_conversion_client'
require 'worldline/acquiring/sdk/v1/acquirer/merchant/technicalreversals/technical_reversals_client'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Acquirer
          module Merchant
            # Merchant client. Thread-safe.
            class MerchantClient < Worldline::Acquiring::SDK::ApiResource

              # @param parent       [Worldline::Acquiring::SDK::ApiResource]
              # @param path_context [Hash, nil]
              def initialize(parent, path_context)
                super(parent: parent, path_context: path_context)
              end

              # Resource /processing/v1/{acquirerId}/{merchantId}/payments
              #
              # @return [Worldline::Acquiring::SDK::V1::Acquirer::Merchant::Cardpayments::CardPaymentsClient]
              def card_payments
                Worldline::Acquiring::SDK::V1::Acquirer::Merchant::Cardpayments::CardPaymentsClient.new(self, nil)
              end

              # Resource /processing/v1/{acquirerId}/{merchantId}/refunds
              #
              # @return [Worldline::Acquiring::SDK::V1::Acquirer::Merchant::Cardrefunds::CardRefundsClient]
              def card_refunds
                Worldline::Acquiring::SDK::V1::Acquirer::Merchant::Cardrefunds::CardRefundsClient.new(self, nil)
              end

              # Resource /processing/v1/{acquirerId}/{merchantId}/account-verifications
              #
              # @return [Worldline::Acquiring::SDK::V1::Acquirer::Merchant::Accountverifications::AccountVerificationsClient]
              def account_verifications
                Worldline::Acquiring::SDK::V1::Acquirer::Merchant::Accountverifications::AccountVerificationsClient.new(self, nil)
              end

              # Resource /processing/v1/{acquirerId}/{merchantId}/balance-inquiries
              #
              # @return [Worldline::Acquiring::SDK::V1::Acquirer::Merchant::Balanceinquiries::BalanceInquiriesClient]
              def balance_inquiries
                Worldline::Acquiring::SDK::V1::Acquirer::Merchant::Balanceinquiries::BalanceInquiriesClient.new(self, nil)
              end

              # Resource /processing/v1/{acquirerId}/{merchantId}/operations/{operationId}/reverse
              #
              # @return [Worldline::Acquiring::SDK::V1::Acquirer::Merchant::Technicalreversals::TechnicalReversalsClient]
              def technical_reversals
                Worldline::Acquiring::SDK::V1::Acquirer::Merchant::Technicalreversals::TechnicalReversalsClient.new(self, nil)
              end

              # Resource /services/v1/{acquirerId}/{merchantId}/dcc-rates
              #
              # @return [Worldline::Acquiring::SDK::V1::Acquirer::Merchant::Dynamiccurrencyconversion::DynamicCurrencyConversionClient]
              def dynamic_currency_conversion
                Worldline::Acquiring::SDK::V1::Acquirer::Merchant::Dynamiccurrencyconversion::DynamicCurrencyConversionClient.new(self, nil)
              end
            end
          end
        end
      end
    end
  end
end
