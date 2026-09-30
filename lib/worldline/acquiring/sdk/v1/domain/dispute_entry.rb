#
# This file was automatically generated.
#
require 'date'

require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/amount_data'
require 'worldline/acquiring/sdk/v1/domain/dispute_document'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Array<Worldline::Acquiring::SDK::V1::Domain::DisputeDocument>] documents
          # @attr [String] elaboration
          # @attr [String] entry_category
          # @attr [String] entry_date_time
          # @attr [String] entry_id
          # @attr [String] entry_type
          # @attr [String] entry_type_description
          # @attr [String] message_text
          # @attr [String] questionnaire
          # @attr [Date] response_due_date
          # @attr [String] scheme_reason
          # @attr [String] scheme_reason_description
          # @attr [Worldline::Acquiring::SDK::V1::Domain::AmountData] settlement_amount
          # @attr [Worldline::Acquiring::SDK::V1::Domain::AmountData] transaction_amount
          # @attr [String] user_id
          class DisputeEntry < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :documents

            attr_accessor :elaboration

            attr_accessor :entry_category

            attr_accessor :entry_date_time

            attr_accessor :entry_id

            attr_accessor :entry_type

            attr_accessor :entry_type_description

            attr_accessor :message_text

            attr_accessor :questionnaire

            attr_accessor :response_due_date

            attr_accessor :scheme_reason

            attr_accessor :scheme_reason_description

            attr_accessor :settlement_amount

            attr_accessor :transaction_amount

            attr_accessor :user_id

            # @return (Hash)
            def to_h
              hash = super
              hash['documents'] = @documents.collect{|val| val.to_h} unless @documents.nil?
              hash['elaboration'] = @elaboration unless @elaboration.nil?
              hash['entryCategory'] = @entry_category unless @entry_category.nil?
              hash['entryDateTime'] = @entry_date_time unless @entry_date_time.nil?
              hash['entryId'] = @entry_id unless @entry_id.nil?
              hash['entryType'] = @entry_type unless @entry_type.nil?
              hash['entryTypeDescription'] = @entry_type_description unless @entry_type_description.nil?
              hash['messageText'] = @message_text unless @message_text.nil?
              hash['questionnaire'] = @questionnaire unless @questionnaire.nil?
              hash['responseDueDate'] = @response_due_date.iso8601 unless @response_due_date.nil?
              hash['schemeReason'] = @scheme_reason unless @scheme_reason.nil?
              hash['schemeReasonDescription'] = @scheme_reason_description unless @scheme_reason_description.nil?
              hash['settlementAmount'] = @settlement_amount.to_h unless @settlement_amount.nil?
              hash['transactionAmount'] = @transaction_amount.to_h unless @transaction_amount.nil?
              hash['userId'] = @user_id unless @user_id.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'documents'
                raise TypeError, "value '%s' is not an Array" % [hash['documents']] unless hash['documents'].is_a? Array
                @documents = []
                hash['documents'].each do |e|
                  @documents << Worldline::Acquiring::SDK::V1::Domain::DisputeDocument.new_from_hash(e)
                end
              end
              if hash.has_key? 'elaboration'
                @elaboration = hash['elaboration']
              end
              if hash.has_key? 'entryCategory'
                @entry_category = hash['entryCategory']
              end
              if hash.has_key? 'entryDateTime'
                @entry_date_time = hash['entryDateTime']
              end
              if hash.has_key? 'entryId'
                @entry_id = hash['entryId']
              end
              if hash.has_key? 'entryType'
                @entry_type = hash['entryType']
              end
              if hash.has_key? 'entryTypeDescription'
                @entry_type_description = hash['entryTypeDescription']
              end
              if hash.has_key? 'messageText'
                @message_text = hash['messageText']
              end
              if hash.has_key? 'questionnaire'
                @questionnaire = hash['questionnaire']
              end
              if hash.has_key? 'responseDueDate'
                @response_due_date = Date.parse(hash['responseDueDate'])
              end
              if hash.has_key? 'schemeReason'
                @scheme_reason = hash['schemeReason']
              end
              if hash.has_key? 'schemeReasonDescription'
                @scheme_reason_description = hash['schemeReasonDescription']
              end
              if hash.has_key? 'settlementAmount'
                raise TypeError, "value '%s' is not a Hash" % [hash['settlementAmount']] unless hash['settlementAmount'].is_a? Hash
                @settlement_amount = Worldline::Acquiring::SDK::V1::Domain::AmountData.new_from_hash(hash['settlementAmount'])
              end
              if hash.has_key? 'transactionAmount'
                raise TypeError, "value '%s' is not a Hash" % [hash['transactionAmount']] unless hash['transactionAmount'].is_a? Hash
                @transaction_amount = Worldline::Acquiring::SDK::V1::Domain::AmountData.new_from_hash(hash['transactionAmount'])
              end
              if hash.has_key? 'userId'
                @user_id = hash['userId']
              end
            end
          end
        end
      end
    end
  end
end
