#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/dispute_merchant_data_base'
require 'worldline/acquiring/sdk/v1/domain/original_transaction_summary_data'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] acquirer_dispute_reference
          # @attr [Worldline::Acquiring::SDK::V1::Domain::DisputeMerchantDataBase] merchant_data
          # @attr [Worldline::Acquiring::SDK::V1::Domain::OriginalTransactionSummaryData] original_transaction_data
          # @attr [String] scheme_reason
          # @attr [String] scheme_reason_description
          # @attr [String] unified_category
          # @attr [String] unified_reason
          class DisputeSummary < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :acquirer_dispute_reference

            attr_accessor :merchant_data

            attr_accessor :original_transaction_data

            attr_accessor :scheme_reason

            attr_accessor :scheme_reason_description

            attr_accessor :unified_category

            attr_accessor :unified_reason

            # @return (Hash)
            def to_h
              hash = super
              hash['acquirerDisputeReference'] = @acquirer_dispute_reference unless @acquirer_dispute_reference.nil?
              hash['merchantData'] = @merchant_data.to_h unless @merchant_data.nil?
              hash['originalTransactionData'] = @original_transaction_data.to_h unless @original_transaction_data.nil?
              hash['schemeReason'] = @scheme_reason unless @scheme_reason.nil?
              hash['schemeReasonDescription'] = @scheme_reason_description unless @scheme_reason_description.nil?
              hash['unifiedCategory'] = @unified_category unless @unified_category.nil?
              hash['unifiedReason'] = @unified_reason unless @unified_reason.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'acquirerDisputeReference'
                @acquirer_dispute_reference = hash['acquirerDisputeReference']
              end
              if hash.has_key? 'merchantData'
                raise TypeError, "value '%s' is not a Hash" % [hash['merchantData']] unless hash['merchantData'].is_a? Hash
                @merchant_data = Worldline::Acquiring::SDK::V1::Domain::DisputeMerchantDataBase.new_from_hash(hash['merchantData'])
              end
              if hash.has_key? 'originalTransactionData'
                raise TypeError, "value '%s' is not a Hash" % [hash['originalTransactionData']] unless hash['originalTransactionData'].is_a? Hash
                @original_transaction_data = Worldline::Acquiring::SDK::V1::Domain::OriginalTransactionSummaryData.new_from_hash(hash['originalTransactionData'])
              end
              if hash.has_key? 'schemeReason'
                @scheme_reason = hash['schemeReason']
              end
              if hash.has_key? 'schemeReasonDescription'
                @scheme_reason_description = hash['schemeReasonDescription']
              end
              if hash.has_key? 'unifiedCategory'
                @unified_category = hash['unifiedCategory']
              end
              if hash.has_key? 'unifiedReason'
                @unified_reason = hash['unifiedReason']
              end
            end
          end
        end
      end
    end
  end
end
