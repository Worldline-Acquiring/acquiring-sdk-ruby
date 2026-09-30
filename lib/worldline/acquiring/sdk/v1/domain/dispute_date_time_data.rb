#
# This file was automatically generated.
#
require 'date'

require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] closed_date_time
          # @attr [String] last_status_changed_date_time
          # @attr [String] opened_date_time
          # @attr [Date] response_due_date
          class DisputeDateTimeData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :closed_date_time

            attr_accessor :last_status_changed_date_time

            attr_accessor :opened_date_time

            attr_accessor :response_due_date

            # @return (Hash)
            def to_h
              hash = super
              hash['closedDateTime'] = @closed_date_time unless @closed_date_time.nil?
              hash['lastStatusChangedDateTime'] = @last_status_changed_date_time unless @last_status_changed_date_time.nil?
              hash['openedDateTime'] = @opened_date_time unless @opened_date_time.nil?
              hash['responseDueDate'] = @response_due_date.iso8601 unless @response_due_date.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'closedDateTime'
                @closed_date_time = hash['closedDateTime']
              end
              if hash.has_key? 'lastStatusChangedDateTime'
                @last_status_changed_date_time = hash['lastStatusChangedDateTime']
              end
              if hash.has_key? 'openedDateTime'
                @opened_date_time = hash['openedDateTime']
              end
              if hash.has_key? 'responseDueDate'
                @response_due_date = Date.parse(hash['responseDueDate'])
              end
            end
          end
        end
      end
    end
  end
end
