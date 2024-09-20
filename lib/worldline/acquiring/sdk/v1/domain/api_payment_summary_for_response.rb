#
# This file was automatically generated.
#
require 'date'

require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/api_references_for_responses'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] payment_id
          # @attr [Worldline::Acquiring::SDK::V1::Domain::ApiReferencesForResponses] references
          # @attr [String] retry_after
          # @attr [String] status
          # @attr [DateTime] status_timestamp
          class ApiPaymentSummaryForResponse < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :payment_id

            attr_accessor :references

            attr_accessor :retry_after

            attr_accessor :status

            attr_accessor :status_timestamp

            # @return (Hash)
            def to_h
              hash = super
              hash['paymentId'] = @payment_id unless @payment_id.nil?
              hash['references'] = @references.to_h unless @references.nil?
              hash['retryAfter'] = @retry_after unless @retry_after.nil?
              hash['status'] = @status unless @status.nil?
              hash['statusTimestamp'] = @status_timestamp.iso8601(3) unless @status_timestamp.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'paymentId'
                @payment_id = hash['paymentId']
              end
              if hash.has_key? 'references'
                raise TypeError, "value '%s' is not a Hash" % [hash['references']] unless hash['references'].is_a? Hash
                @references = Worldline::Acquiring::SDK::V1::Domain::ApiReferencesForResponses.new_from_hash(hash['references'])
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
            end
          end
        end
      end
    end
  end
end
