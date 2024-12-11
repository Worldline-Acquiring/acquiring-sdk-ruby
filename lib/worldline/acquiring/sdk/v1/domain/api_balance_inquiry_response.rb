#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/amount_data'
require 'worldline/acquiring/sdk/v1/domain/api_references_for_responses'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] authorization_code
          # @attr [Worldline::Acquiring::SDK::V1::Domain::AmountData] available_amount
          # @attr [String] operation_id
          # @attr [Worldline::Acquiring::SDK::V1::Domain::ApiReferencesForResponses] references
          # @attr [String] responder
          # @attr [String] response_code
          # @attr [String] response_code_category
          # @attr [String] response_code_description
          class ApiBalanceInquiryResponse < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :authorization_code

            attr_accessor :available_amount

            attr_accessor :operation_id

            attr_accessor :references

            attr_accessor :responder

            attr_accessor :response_code

            attr_accessor :response_code_category

            attr_accessor :response_code_description

            # @return (Hash)
            def to_h
              hash = super
              hash['authorizationCode'] = @authorization_code unless @authorization_code.nil?
              hash['availableAmount'] = @available_amount.to_h unless @available_amount.nil?
              hash['operationId'] = @operation_id unless @operation_id.nil?
              hash['references'] = @references.to_h unless @references.nil?
              hash['responder'] = @responder unless @responder.nil?
              hash['responseCode'] = @response_code unless @response_code.nil?
              hash['responseCodeCategory'] = @response_code_category unless @response_code_category.nil?
              hash['responseCodeDescription'] = @response_code_description unless @response_code_description.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'authorizationCode'
                @authorization_code = hash['authorizationCode']
              end
              if hash.has_key? 'availableAmount'
                raise TypeError, "value '%s' is not a Hash" % [hash['availableAmount']] unless hash['availableAmount'].is_a? Hash
                @available_amount = Worldline::Acquiring::SDK::V1::Domain::AmountData.new_from_hash(hash['availableAmount'])
              end
              if hash.has_key? 'operationId'
                @operation_id = hash['operationId']
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
            end
          end
        end
      end
    end
  end
end
