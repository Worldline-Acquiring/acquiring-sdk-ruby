#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/amount_data'
require 'worldline/acquiring/sdk/v1/domain/dispute_date_time_data'
require 'worldline/acquiring/sdk/v1/domain/dispute_merchant_data'
require 'worldline/acquiring/sdk/v1/domain/dispute_references'
require 'worldline/acquiring/sdk/v1/domain/original_transaction_data'
require 'worldline/acquiring/sdk/v1/domain/signed_amount_data'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Worldline::Acquiring::SDK::V1::Domain::DisputeDateTimeData] dispute_date_time_data
          # @attr [String] dispute_id
          # @attr [Worldline::Acquiring::SDK::V1::Domain::DisputeReferences] dispute_references
          # @attr [String] dispute_stage
          # @attr [String] dispute_status
          # @attr [String] dispute_status_category
          # @attr [true/false] is_open
          # @attr [Worldline::Acquiring::SDK::V1::Domain::SignedAmountData] merchant_balance_amount
          # @attr [Worldline::Acquiring::SDK::V1::Domain::DisputeMerchantData] merchant_data
          # @attr [Worldline::Acquiring::SDK::V1::Domain::AmountData] original_dispute_amount
          # @attr [Worldline::Acquiring::SDK::V1::Domain::OriginalTransactionData] original_transaction_data
          # @attr [String] scheme_reason
          # @attr [String] scheme_reason_description
          # @attr [String] unified_category
          # @attr [String] unified_reason
          class DisputeCase < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :dispute_date_time_data

            attr_accessor :dispute_id

            attr_accessor :dispute_references

            attr_accessor :dispute_stage

            attr_accessor :dispute_status

            attr_accessor :dispute_status_category

            attr_accessor :is_open

            attr_accessor :merchant_balance_amount

            attr_accessor :merchant_data

            attr_accessor :original_dispute_amount

            attr_accessor :original_transaction_data

            attr_accessor :scheme_reason

            attr_accessor :scheme_reason_description

            attr_accessor :unified_category

            attr_accessor :unified_reason

            # @return (Hash)
            def to_h
              hash = super
              hash['disputeDateTimeData'] = @dispute_date_time_data.to_h unless @dispute_date_time_data.nil?
              hash['disputeId'] = @dispute_id unless @dispute_id.nil?
              hash['disputeReferences'] = @dispute_references.to_h unless @dispute_references.nil?
              hash['disputeStage'] = @dispute_stage unless @dispute_stage.nil?
              hash['disputeStatus'] = @dispute_status unless @dispute_status.nil?
              hash['disputeStatusCategory'] = @dispute_status_category unless @dispute_status_category.nil?
              hash['isOpen'] = @is_open unless @is_open.nil?
              hash['merchantBalanceAmount'] = @merchant_balance_amount.to_h unless @merchant_balance_amount.nil?
              hash['merchantData'] = @merchant_data.to_h unless @merchant_data.nil?
              hash['originalDisputeAmount'] = @original_dispute_amount.to_h unless @original_dispute_amount.nil?
              hash['originalTransactionData'] = @original_transaction_data.to_h unless @original_transaction_data.nil?
              hash['schemeReason'] = @scheme_reason unless @scheme_reason.nil?
              hash['schemeReasonDescription'] = @scheme_reason_description unless @scheme_reason_description.nil?
              hash['unifiedCategory'] = @unified_category unless @unified_category.nil?
              hash['unifiedReason'] = @unified_reason unless @unified_reason.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'disputeDateTimeData'
                raise TypeError, "value '%s' is not a Hash" % [hash['disputeDateTimeData']] unless hash['disputeDateTimeData'].is_a? Hash
                @dispute_date_time_data = Worldline::Acquiring::SDK::V1::Domain::DisputeDateTimeData.new_from_hash(hash['disputeDateTimeData'])
              end
              if hash.has_key? 'disputeId'
                @dispute_id = hash['disputeId']
              end
              if hash.has_key? 'disputeReferences'
                raise TypeError, "value '%s' is not a Hash" % [hash['disputeReferences']] unless hash['disputeReferences'].is_a? Hash
                @dispute_references = Worldline::Acquiring::SDK::V1::Domain::DisputeReferences.new_from_hash(hash['disputeReferences'])
              end
              if hash.has_key? 'disputeStage'
                @dispute_stage = hash['disputeStage']
              end
              if hash.has_key? 'disputeStatus'
                @dispute_status = hash['disputeStatus']
              end
              if hash.has_key? 'disputeStatusCategory'
                @dispute_status_category = hash['disputeStatusCategory']
              end
              if hash.has_key? 'isOpen'
                @is_open = hash['isOpen']
              end
              if hash.has_key? 'merchantBalanceAmount'
                raise TypeError, "value '%s' is not a Hash" % [hash['merchantBalanceAmount']] unless hash['merchantBalanceAmount'].is_a? Hash
                @merchant_balance_amount = Worldline::Acquiring::SDK::V1::Domain::SignedAmountData.new_from_hash(hash['merchantBalanceAmount'])
              end
              if hash.has_key? 'merchantData'
                raise TypeError, "value '%s' is not a Hash" % [hash['merchantData']] unless hash['merchantData'].is_a? Hash
                @merchant_data = Worldline::Acquiring::SDK::V1::Domain::DisputeMerchantData.new_from_hash(hash['merchantData'])
              end
              if hash.has_key? 'originalDisputeAmount'
                raise TypeError, "value '%s' is not a Hash" % [hash['originalDisputeAmount']] unless hash['originalDisputeAmount'].is_a? Hash
                @original_dispute_amount = Worldline::Acquiring::SDK::V1::Domain::AmountData.new_from_hash(hash['originalDisputeAmount'])
              end
              if hash.has_key? 'originalTransactionData'
                raise TypeError, "value '%s' is not a Hash" % [hash['originalTransactionData']] unless hash['originalTransactionData'].is_a? Hash
                @original_transaction_data = Worldline::Acquiring::SDK::V1::Domain::OriginalTransactionData.new_from_hash(hash['originalTransactionData'])
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
