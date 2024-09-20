#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/address_verification_data'
require 'worldline/acquiring/sdk/v1/domain/three_d_secure'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Worldline::Acquiring::SDK::V1::Domain::AddressVerificationData] address_verification_data
          # @attr [String] sca_exemption_request
          # @attr [Worldline::Acquiring::SDK::V1::Domain::ThreeDSecure] three_d_secure
          class ECommerceData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :address_verification_data

            attr_accessor :sca_exemption_request

            attr_accessor :three_d_secure

            # @return (Hash)
            def to_h
              hash = super
              hash['addressVerificationData'] = @address_verification_data.to_h unless @address_verification_data.nil?
              hash['scaExemptionRequest'] = @sca_exemption_request unless @sca_exemption_request.nil?
              hash['threeDSecure'] = @three_d_secure.to_h unless @three_d_secure.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'addressVerificationData'
                raise TypeError, "value '%s' is not a Hash" % [hash['addressVerificationData']] unless hash['addressVerificationData'].is_a? Hash
                @address_verification_data = Worldline::Acquiring::SDK::V1::Domain::AddressVerificationData.new_from_hash(hash['addressVerificationData'])
              end
              if hash.has_key? 'scaExemptionRequest'
                @sca_exemption_request = hash['scaExemptionRequest']
              end
              if hash.has_key? 'threeDSecure'
                raise TypeError, "value '%s' is not a Hash" % [hash['threeDSecure']] unless hash['threeDSecure'].is_a? Hash
                @three_d_secure = Worldline::Acquiring::SDK::V1::Domain::ThreeDSecure.new_from_hash(hash['threeDSecure'])
              end
            end
          end
        end
      end
    end
  end
end
