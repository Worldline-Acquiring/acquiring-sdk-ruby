#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/dcc_proposal'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] disclaimer_display
          # @attr [String] disclaimer_receipt
          # @attr [Worldline::Acquiring::SDK::V1::Domain::DccProposal] proposal
          # @attr [String] result
          class GetDccRateResponse < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :disclaimer_display

            attr_accessor :disclaimer_receipt

            attr_accessor :proposal

            attr_accessor :result

            # @return (Hash)
            def to_h
              hash = super
              hash['disclaimerDisplay'] = @disclaimer_display unless @disclaimer_display.nil?
              hash['disclaimerReceipt'] = @disclaimer_receipt unless @disclaimer_receipt.nil?
              hash['proposal'] = @proposal.to_h unless @proposal.nil?
              hash['result'] = @result unless @result.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'disclaimerDisplay'
                @disclaimer_display = hash['disclaimerDisplay']
              end
              if hash.has_key? 'disclaimerReceipt'
                @disclaimer_receipt = hash['disclaimerReceipt']
              end
              if hash.has_key? 'proposal'
                raise TypeError, "value '%s' is not a Hash" % [hash['proposal']] unless hash['proposal'].is_a? Hash
                @proposal = Worldline::Acquiring::SDK::V1::Domain::DccProposal.new_from_hash(hash['proposal'])
              end
              if hash.has_key? 'result'
                @result = hash['result']
              end
            end
          end
        end
      end
    end
  end
end
