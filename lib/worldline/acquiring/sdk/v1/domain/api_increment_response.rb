#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/v1/domain/amount_data'
require 'worldline/acquiring/sdk/v1/domain/api_action_response'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] authorization_code
          # @attr [Worldline::Acquiring::SDK::V1::Domain::AmountData] total_authorized_amount
          class ApiIncrementResponse < Worldline::Acquiring::SDK::V1::Domain::ApiActionResponse

            attr_accessor :authorization_code

            attr_accessor :total_authorized_amount

            # @return (Hash)
            def to_h
              hash = super
              hash['authorizationCode'] = @authorization_code unless @authorization_code.nil?
              hash['totalAuthorizedAmount'] = @total_authorized_amount.to_h unless @total_authorized_amount.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'authorizationCode'
                @authorization_code = hash['authorizationCode']
              end
              if hash.has_key? 'totalAuthorizedAmount'
                raise TypeError, "value '%s' is not a Hash" % [hash['totalAuthorizedAmount']] unless hash['totalAuthorizedAmount'].is_a? Hash
                @total_authorized_amount = Worldline::Acquiring::SDK::V1::Domain::AmountData.new_from_hash(hash['totalAuthorizedAmount'])
              end
            end
          end
        end
      end
    end
  end
end
