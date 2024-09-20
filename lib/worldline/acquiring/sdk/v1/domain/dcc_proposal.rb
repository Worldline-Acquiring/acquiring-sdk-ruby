#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/amount_data'
require 'worldline/acquiring/sdk/v1/domain/rate_data'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Worldline::Acquiring::SDK::V1::Domain::AmountData] original_amount
          # @attr [Worldline::Acquiring::SDK::V1::Domain::RateData] rate
          # @attr [String] rate_reference_id
          # @attr [Worldline::Acquiring::SDK::V1::Domain::AmountData] resulting_amount
          class DccProposal < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :original_amount

            attr_accessor :rate

            attr_accessor :rate_reference_id

            attr_accessor :resulting_amount

            # @return (Hash)
            def to_h
              hash = super
              hash['originalAmount'] = @original_amount.to_h unless @original_amount.nil?
              hash['rate'] = @rate.to_h unless @rate.nil?
              hash['rateReferenceId'] = @rate_reference_id unless @rate_reference_id.nil?
              hash['resultingAmount'] = @resulting_amount.to_h unless @resulting_amount.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'originalAmount'
                raise TypeError, "value '%s' is not a Hash" % [hash['originalAmount']] unless hash['originalAmount'].is_a? Hash
                @original_amount = Worldline::Acquiring::SDK::V1::Domain::AmountData.new_from_hash(hash['originalAmount'])
              end
              if hash.has_key? 'rate'
                raise TypeError, "value '%s' is not a Hash" % [hash['rate']] unless hash['rate'].is_a? Hash
                @rate = Worldline::Acquiring::SDK::V1::Domain::RateData.new_from_hash(hash['rate'])
              end
              if hash.has_key? 'rateReferenceId'
                @rate_reference_id = hash['rateReferenceId']
              end
              if hash.has_key? 'resultingAmount'
                raise TypeError, "value '%s' is not a Hash" % [hash['resultingAmount']] unless hash['resultingAmount'].is_a? Hash
                @resulting_amount = Worldline::Acquiring::SDK::V1::Domain::AmountData.new_from_hash(hash['resultingAmount'])
              end
            end
          end
        end
      end
    end
  end
end
