#
# This file was automatically generated.
#
require 'date'

require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/terminal_data'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] operation_id
          # @attr [String] reason
          # @attr [Worldline::Acquiring::SDK::V1::Domain::TerminalData] terminal_data
          # @attr [DateTime] transaction_timestamp
          class ApiTechnicalReversalRequest < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :operation_id

            attr_accessor :reason

            attr_accessor :terminal_data

            attr_accessor :transaction_timestamp

            # @return (Hash)
            def to_h
              hash = super
              hash['operationId'] = @operation_id unless @operation_id.nil?
              hash['reason'] = @reason unless @reason.nil?
              hash['terminalData'] = @terminal_data.to_h unless @terminal_data.nil?
              hash['transactionTimestamp'] = @transaction_timestamp.iso8601(3) unless @transaction_timestamp.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'operationId'
                @operation_id = hash['operationId']
              end
              if hash.has_key? 'reason'
                @reason = hash['reason']
              end
              if hash.has_key? 'terminalData'
                raise TypeError, "value '%s' is not a Hash" % [hash['terminalData']] unless hash['terminalData'].is_a? Hash
                @terminal_data = Worldline::Acquiring::SDK::V1::Domain::TerminalData.new_from_hash(hash['terminalData'])
              end
              if hash.has_key? 'transactionTimestamp'
                @transaction_timestamp = DateTime.parse(hash['transactionTimestamp'])
              end
            end
          end
        end
      end
    end
  end
end
