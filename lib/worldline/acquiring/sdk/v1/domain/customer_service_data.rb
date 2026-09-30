#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] customer_service_email
          # @attr [String] customer_service_phone_number
          # @attr [String] customer_service_url
          class CustomerServiceData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :customer_service_email

            attr_accessor :customer_service_phone_number

            attr_accessor :customer_service_url

            # @return (Hash)
            def to_h
              hash = super
              hash['customerServiceEmail'] = @customer_service_email unless @customer_service_email.nil?
              hash['customerServicePhoneNumber'] = @customer_service_phone_number unless @customer_service_phone_number.nil?
              hash['customerServiceUrl'] = @customer_service_url unless @customer_service_url.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'customerServiceEmail'
                @customer_service_email = hash['customerServiceEmail']
              end
              if hash.has_key? 'customerServicePhoneNumber'
                @customer_service_phone_number = hash['customerServicePhoneNumber']
              end
              if hash.has_key? 'customerServiceUrl'
                @customer_service_url = hash['customerServiceUrl']
              end
            end
          end
        end
      end
    end
  end
end
