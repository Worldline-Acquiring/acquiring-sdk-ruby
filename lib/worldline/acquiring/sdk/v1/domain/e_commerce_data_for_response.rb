#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] address_verification_result
          # @attr [String] card_security_code_result
          class ECommerceDataForResponse < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :address_verification_result

            attr_accessor :card_security_code_result

            # @return (Hash)
            def to_h
              hash = super
              hash['addressVerificationResult'] = @address_verification_result unless @address_verification_result.nil?
              hash['cardSecurityCodeResult'] = @card_security_code_result unless @card_security_code_result.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'addressVerificationResult'
                @address_verification_result = hash['addressVerificationResult']
              end
              if hash.has_key? 'cardSecurityCodeResult'
                @card_security_code_result = hash['cardSecurityCodeResult']
              end
            end
          end
        end
      end
    end
  end
end
