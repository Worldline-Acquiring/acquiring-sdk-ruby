#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] cardholder_address
          # @attr [String] cardholder_postal_code
          class AddressVerificationData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :cardholder_address

            attr_accessor :cardholder_postal_code

            # @return (Hash)
            def to_h
              hash = super
              hash['cardholderAddress'] = @cardholder_address unless @cardholder_address.nil?
              hash['cardholderPostalCode'] = @cardholder_postal_code unless @cardholder_postal_code.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'cardholderAddress'
                @cardholder_address = hash['cardholderAddress']
              end
              if hash.has_key? 'cardholderPostalCode'
                @cardholder_postal_code = hash['cardholderPostalCode']
              end
            end
          end
        end
      end
    end
  end
end
