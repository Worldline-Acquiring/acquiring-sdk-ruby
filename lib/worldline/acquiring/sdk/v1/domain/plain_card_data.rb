#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] card_number
          # @attr [String] card_security_code
          # @attr [String] expiry_date
          class PlainCardData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :card_number

            attr_accessor :card_security_code

            attr_accessor :expiry_date

            # @return (Hash)
            def to_h
              hash = super
              hash['cardNumber'] = @card_number unless @card_number.nil?
              hash['cardSecurityCode'] = @card_security_code unless @card_security_code.nil?
              hash['expiryDate'] = @expiry_date unless @expiry_date.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'cardNumber'
                @card_number = hash['cardNumber']
              end
              if hash.has_key? 'cardSecurityCode'
                @card_security_code = hash['cardSecurityCode']
              end
              if hash.has_key? 'expiryDate'
                @expiry_date = hash['expiryDate']
              end
            end
          end
        end
      end
    end
  end
end
