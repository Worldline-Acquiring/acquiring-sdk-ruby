#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/date_range'
require 'worldline/acquiring/sdk/v1/domain/date_time_range'
require 'worldline/acquiring/sdk/v1/domain/merchant_scope'
require 'worldline/acquiring/sdk/v1/domain/pagination_request'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] acquirer_dispute_reference
          # @attr [String] acquirer_reference_number
          # @attr [Worldline::Acquiring::SDK::V1::Domain::DateTimeRange] closed_date_time
          # @attr [String] dispute_id
          # @attr [Array<String>] dispute_stages
          # @attr [Array<String>] dispute_status_categories
          # @attr [true/false] is_open
          # @attr [Worldline::Acquiring::SDK::V1::Domain::DateTimeRange] last_status_changed_date_time
          # @attr [String] merchant_reference
          # @attr [Worldline::Acquiring::SDK::V1::Domain::MerchantScope] merchant_scope
          # @attr [Worldline::Acquiring::SDK::V1::Domain::DateTimeRange] opened_date_time
          # @attr [Worldline::Acquiring::SDK::V1::Domain::PaginationRequest] pagination
          # @attr [String] payment_id
          # @attr [Worldline::Acquiring::SDK::V1::Domain::DateRange] response_due_date
          # @attr [Array<String>] schemes
          # @attr [String] sort_by
          # @attr [String] sort_order
          # @attr [Array<String>] unified_categories
          class SearchDisputesRequest < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :acquirer_dispute_reference

            attr_accessor :acquirer_reference_number

            attr_accessor :closed_date_time

            attr_accessor :dispute_id

            attr_accessor :dispute_stages

            attr_accessor :dispute_status_categories

            attr_accessor :is_open

            attr_accessor :last_status_changed_date_time

            attr_accessor :merchant_reference

            attr_accessor :merchant_scope

            attr_accessor :opened_date_time

            attr_accessor :pagination

            attr_accessor :payment_id

            attr_accessor :response_due_date

            attr_accessor :schemes

            attr_accessor :sort_by

            attr_accessor :sort_order

            attr_accessor :unified_categories

            # @return (Hash)
            def to_h
              hash = super
              hash['acquirerDisputeReference'] = @acquirer_dispute_reference unless @acquirer_dispute_reference.nil?
              hash['acquirerReferenceNumber'] = @acquirer_reference_number unless @acquirer_reference_number.nil?
              hash['closedDateTime'] = @closed_date_time.to_h unless @closed_date_time.nil?
              hash['disputeId'] = @dispute_id unless @dispute_id.nil?
              hash['disputeStages'] = @dispute_stages unless @dispute_stages.nil?
              hash['disputeStatusCategories'] = @dispute_status_categories unless @dispute_status_categories.nil?
              hash['isOpen'] = @is_open unless @is_open.nil?
              hash['lastStatusChangedDateTime'] = @last_status_changed_date_time.to_h unless @last_status_changed_date_time.nil?
              hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
              hash['merchantScope'] = @merchant_scope.to_h unless @merchant_scope.nil?
              hash['openedDateTime'] = @opened_date_time.to_h unless @opened_date_time.nil?
              hash['pagination'] = @pagination.to_h unless @pagination.nil?
              hash['paymentId'] = @payment_id unless @payment_id.nil?
              hash['responseDueDate'] = @response_due_date.to_h unless @response_due_date.nil?
              hash['schemes'] = @schemes unless @schemes.nil?
              hash['sortBy'] = @sort_by unless @sort_by.nil?
              hash['sortOrder'] = @sort_order unless @sort_order.nil?
              hash['unifiedCategories'] = @unified_categories unless @unified_categories.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'acquirerDisputeReference'
                @acquirer_dispute_reference = hash['acquirerDisputeReference']
              end
              if hash.has_key? 'acquirerReferenceNumber'
                @acquirer_reference_number = hash['acquirerReferenceNumber']
              end
              if hash.has_key? 'closedDateTime'
                raise TypeError, "value '%s' is not a Hash" % [hash['closedDateTime']] unless hash['closedDateTime'].is_a? Hash
                @closed_date_time = Worldline::Acquiring::SDK::V1::Domain::DateTimeRange.new_from_hash(hash['closedDateTime'])
              end
              if hash.has_key? 'disputeId'
                @dispute_id = hash['disputeId']
              end
              if hash.has_key? 'disputeStages'
                raise TypeError, "value '%s' is not an Array" % [hash['disputeStages']] unless hash['disputeStages'].is_a? Array
                @dispute_stages = []
                hash['disputeStages'].each do |e|
                  @dispute_stages << e
                end
              end
              if hash.has_key? 'disputeStatusCategories'
                raise TypeError, "value '%s' is not an Array" % [hash['disputeStatusCategories']] unless hash['disputeStatusCategories'].is_a? Array
                @dispute_status_categories = []
                hash['disputeStatusCategories'].each do |e|
                  @dispute_status_categories << e
                end
              end
              if hash.has_key? 'isOpen'
                @is_open = hash['isOpen']
              end
              if hash.has_key? 'lastStatusChangedDateTime'
                raise TypeError, "value '%s' is not a Hash" % [hash['lastStatusChangedDateTime']] unless hash['lastStatusChangedDateTime'].is_a? Hash
                @last_status_changed_date_time = Worldline::Acquiring::SDK::V1::Domain::DateTimeRange.new_from_hash(hash['lastStatusChangedDateTime'])
              end
              if hash.has_key? 'merchantReference'
                @merchant_reference = hash['merchantReference']
              end
              if hash.has_key? 'merchantScope'
                raise TypeError, "value '%s' is not a Hash" % [hash['merchantScope']] unless hash['merchantScope'].is_a? Hash
                @merchant_scope = Worldline::Acquiring::SDK::V1::Domain::MerchantScope.new_from_hash(hash['merchantScope'])
              end
              if hash.has_key? 'openedDateTime'
                raise TypeError, "value '%s' is not a Hash" % [hash['openedDateTime']] unless hash['openedDateTime'].is_a? Hash
                @opened_date_time = Worldline::Acquiring::SDK::V1::Domain::DateTimeRange.new_from_hash(hash['openedDateTime'])
              end
              if hash.has_key? 'pagination'
                raise TypeError, "value '%s' is not a Hash" % [hash['pagination']] unless hash['pagination'].is_a? Hash
                @pagination = Worldline::Acquiring::SDK::V1::Domain::PaginationRequest.new_from_hash(hash['pagination'])
              end
              if hash.has_key? 'paymentId'
                @payment_id = hash['paymentId']
              end
              if hash.has_key? 'responseDueDate'
                raise TypeError, "value '%s' is not a Hash" % [hash['responseDueDate']] unless hash['responseDueDate'].is_a? Hash
                @response_due_date = Worldline::Acquiring::SDK::V1::Domain::DateRange.new_from_hash(hash['responseDueDate'])
              end
              if hash.has_key? 'schemes'
                raise TypeError, "value '%s' is not an Array" % [hash['schemes']] unless hash['schemes'].is_a? Array
                @schemes = []
                hash['schemes'].each do |e|
                  @schemes << e
                end
              end
              if hash.has_key? 'sortBy'
                @sort_by = hash['sortBy']
              end
              if hash.has_key? 'sortOrder'
                @sort_order = hash['sortOrder']
              end
              if hash.has_key? 'unifiedCategories'
                raise TypeError, "value '%s' is not an Array" % [hash['unifiedCategories']] unless hash['unifiedCategories'].is_a? Array
                @unified_categories = []
                hash['unifiedCategories'].each do |e|
                  @unified_categories << e
                end
              end
            end
          end
        end
      end
    end
  end
end
