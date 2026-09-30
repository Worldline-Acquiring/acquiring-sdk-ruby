#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/date_time_range'
require 'worldline/acquiring/sdk/v1/domain/merchant_scope'
require 'worldline/acquiring/sdk/v1/domain/pagination_request'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] dispute_id
          # @attr [Array<String>] entry_categories
          # @attr [Worldline::Acquiring::SDK::V1::Domain::DateTimeRange] entry_date_time
          # @attr [String] entry_id
          # @attr [Array<String>] entry_types
          # @attr [true/false] include_dispute_summary
          # @attr [Worldline::Acquiring::SDK::V1::Domain::MerchantScope] merchant_scope
          # @attr [Worldline::Acquiring::SDK::V1::Domain::PaginationRequest] pagination
          # @attr [String] sort_order
          class SearchDisputeEntriesRequest < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :dispute_id

            attr_accessor :entry_categories

            attr_accessor :entry_date_time

            attr_accessor :entry_id

            attr_accessor :entry_types

            attr_accessor :include_dispute_summary

            attr_accessor :merchant_scope

            attr_accessor :pagination

            attr_accessor :sort_order

            # @return (Hash)
            def to_h
              hash = super
              hash['disputeId'] = @dispute_id unless @dispute_id.nil?
              hash['entryCategories'] = @entry_categories unless @entry_categories.nil?
              hash['entryDateTime'] = @entry_date_time.to_h unless @entry_date_time.nil?
              hash['entryId'] = @entry_id unless @entry_id.nil?
              hash['entryTypes'] = @entry_types unless @entry_types.nil?
              hash['includeDisputeSummary'] = @include_dispute_summary unless @include_dispute_summary.nil?
              hash['merchantScope'] = @merchant_scope.to_h unless @merchant_scope.nil?
              hash['pagination'] = @pagination.to_h unless @pagination.nil?
              hash['sortOrder'] = @sort_order unless @sort_order.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'disputeId'
                @dispute_id = hash['disputeId']
              end
              if hash.has_key? 'entryCategories'
                raise TypeError, "value '%s' is not an Array" % [hash['entryCategories']] unless hash['entryCategories'].is_a? Array
                @entry_categories = []
                hash['entryCategories'].each do |e|
                  @entry_categories << e
                end
              end
              if hash.has_key? 'entryDateTime'
                raise TypeError, "value '%s' is not a Hash" % [hash['entryDateTime']] unless hash['entryDateTime'].is_a? Hash
                @entry_date_time = Worldline::Acquiring::SDK::V1::Domain::DateTimeRange.new_from_hash(hash['entryDateTime'])
              end
              if hash.has_key? 'entryId'
                @entry_id = hash['entryId']
              end
              if hash.has_key? 'entryTypes'
                raise TypeError, "value '%s' is not an Array" % [hash['entryTypes']] unless hash['entryTypes'].is_a? Array
                @entry_types = []
                hash['entryTypes'].each do |e|
                  @entry_types << e
                end
              end
              if hash.has_key? 'includeDisputeSummary'
                @include_dispute_summary = hash['includeDisputeSummary']
              end
              if hash.has_key? 'merchantScope'
                raise TypeError, "value '%s' is not a Hash" % [hash['merchantScope']] unless hash['merchantScope'].is_a? Hash
                @merchant_scope = Worldline::Acquiring::SDK::V1::Domain::MerchantScope.new_from_hash(hash['merchantScope'])
              end
              if hash.has_key? 'pagination'
                raise TypeError, "value '%s' is not a Hash" % [hash['pagination']] unless hash['pagination'].is_a? Hash
                @pagination = Worldline::Acquiring::SDK::V1::Domain::PaginationRequest.new_from_hash(hash['pagination'])
              end
              if hash.has_key? 'sortOrder'
                @sort_order = hash['sortOrder']
              end
            end
          end
        end
      end
    end
  end
end
