#
# This file was automatically generated.
#
require 'date'

require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/amount_data'
require 'worldline/acquiring/sdk/v1/domain/api_references_for_responses'
require 'worldline/acquiring/sdk/v1/domain/card_payment_data_for_response'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Worldline::Acquiring::SDK::V1::Domain::CardPaymentDataForResponse] card_payment_data
          # @attr [String] initial_authorization_code
          # @attr [String] operation_id
          # @attr [String] payment_id
          # @attr [Worldline::Acquiring::SDK::V1::Domain::ApiReferencesForResponses] references
          # @attr [String] responder
          # @attr [String] response_code
          # @attr [String] response_code_category
          # @attr [String] response_code_description
          # @attr [String] retry_after
          # @attr [String] status
          # @attr [DateTime] status_timestamp
          # @attr [Worldline::Acquiring::SDK::V1::Domain::AmountData] total_authorized_amount
          class ApiPaymentResponse < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :card_payment_data

            attr_accessor :initial_authorization_code

            attr_accessor :operation_id

            attr_accessor :payment_id

            attr_accessor :references

            attr_accessor :responder

            attr_accessor :response_code

            attr_accessor :response_code_category

            attr_accessor :response_code_description

            attr_accessor :retry_after

            attr_accessor :status

            attr_accessor :status_timestamp

            attr_accessor :total_authorized_amount

            # @return (Hash)
            def to_h
              hash = super
              hash['cardPaymentData'] = @card_payment_data.to_h unless @card_payment_data.nil?
              hash['initialAuthorizationCode'] = @initial_authorization_code unless @initial_authorization_code.nil?
              hash['operationId'] = @operation_id unless @operation_id.nil?
              hash['paymentId'] = @payment_id unless @payment_id.nil?
              hash['references'] = @references.to_h unless @references.nil?
              hash['responder'] = @responder unless @responder.nil?
              hash['responseCode'] = @response_code unless @response_code.nil?
              hash['responseCodeCategory'] = @response_code_category unless @response_code_category.nil?
              hash['responseCodeDescription'] = @response_code_description unless @response_code_description.nil?
              hash['retryAfter'] = @retry_after unless @retry_after.nil?
              hash['status'] = @status unless @status.nil?
              hash['statusTimestamp'] = @status_timestamp.iso8601(3) unless @status_timestamp.nil?
              hash['totalAuthorizedAmount'] = @total_authorized_amount.to_h unless @total_authorized_amount.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'cardPaymentData'
                raise TypeError, "value '%s' is not a Hash" % [hash['cardPaymentData']] unless hash['cardPaymentData'].is_a? Hash
                @card_payment_data = Worldline::Acquiring::SDK::V1::Domain::CardPaymentDataForResponse.new_from_hash(hash['cardPaymentData'])
              end
              if hash.has_key? 'initialAuthorizationCode'
                @initial_authorization_code = hash['initialAuthorizationCode']
              end
              if hash.has_key? 'operationId'
                @operation_id = hash['operationId']
              end
              if hash.has_key? 'paymentId'
                @payment_id = hash['paymentId']
              end
              if hash.has_key? 'references'
                raise TypeError, "value '%s' is not a Hash" % [hash['references']] unless hash['references'].is_a? Hash
                @references = Worldline::Acquiring::SDK::V1::Domain::ApiReferencesForResponses.new_from_hash(hash['references'])
              end
              if hash.has_key? 'responder'
                @responder = hash['responder']
              end
              if hash.has_key? 'responseCode'
                @response_code = hash['responseCode']
              end
              if hash.has_key? 'responseCodeCategory'
                @response_code_category = hash['responseCodeCategory']
              end
              if hash.has_key? 'responseCodeDescription'
                @response_code_description = hash['responseCodeDescription']
              end
              if hash.has_key? 'retryAfter'
                @retry_after = hash['retryAfter']
              end
              if hash.has_key? 'status'
                @status = hash['status']
              end
              if hash.has_key? 'statusTimestamp'
                @status_timestamp = DateTime.parse(hash['statusTimestamp'])
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
