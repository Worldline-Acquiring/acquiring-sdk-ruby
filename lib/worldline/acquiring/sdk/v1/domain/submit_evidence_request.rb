#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/amount_data'
require 'worldline/acquiring/sdk/v1/domain/dispute_document_id_item'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Array<Worldline::Acquiring::SDK::V1::Domain::DisputeDocumentIdItem>] document_ids
          # @attr [String] elaboration
          # @attr [true/false] include_entries
          # @attr [Worldline::Acquiring::SDK::V1::Domain::AmountData] partial_amount
          # @attr [String] user_id
          class SubmitEvidenceRequest < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :document_ids

            attr_accessor :elaboration

            attr_accessor :include_entries

            attr_accessor :partial_amount

            attr_accessor :user_id

            # @return (Hash)
            def to_h
              hash = super
              hash['documentIds'] = @document_ids.collect{|val| val.to_h} unless @document_ids.nil?
              hash['elaboration'] = @elaboration unless @elaboration.nil?
              hash['includeEntries'] = @include_entries unless @include_entries.nil?
              hash['partialAmount'] = @partial_amount.to_h unless @partial_amount.nil?
              hash['userId'] = @user_id unless @user_id.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'documentIds'
                raise TypeError, "value '%s' is not an Array" % [hash['documentIds']] unless hash['documentIds'].is_a? Array
                @document_ids = []
                hash['documentIds'].each do |e|
                  @document_ids << Worldline::Acquiring::SDK::V1::Domain::DisputeDocumentIdItem.new_from_hash(e)
                end
              end
              if hash.has_key? 'elaboration'
                @elaboration = hash['elaboration']
              end
              if hash.has_key? 'includeEntries'
                @include_entries = hash['includeEntries']
              end
              if hash.has_key? 'partialAmount'
                raise TypeError, "value '%s' is not a Hash" % [hash['partialAmount']] unless hash['partialAmount'].is_a? Hash
                @partial_amount = Worldline::Acquiring::SDK::V1::Domain::AmountData.new_from_hash(hash['partialAmount'])
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
