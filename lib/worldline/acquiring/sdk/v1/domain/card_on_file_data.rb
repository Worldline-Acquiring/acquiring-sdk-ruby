#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/initial_card_on_file_data'
require 'worldline/acquiring/sdk/v1/domain/subsequent_card_on_file_data'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Worldline::Acquiring::SDK::V1::Domain::InitialCardOnFileData] initial_card_on_file_data
          # @attr [true/false] is_initial_transaction
          # @attr [Worldline::Acquiring::SDK::V1::Domain::SubsequentCardOnFileData] subsequent_card_on_file_data
          class CardOnFileData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :initial_card_on_file_data

            attr_accessor :is_initial_transaction

            attr_accessor :subsequent_card_on_file_data

            # @return (Hash)
            def to_h
              hash = super
              hash['initialCardOnFileData'] = @initial_card_on_file_data.to_h unless @initial_card_on_file_data.nil?
              hash['isInitialTransaction'] = @is_initial_transaction unless @is_initial_transaction.nil?
              hash['subsequentCardOnFileData'] = @subsequent_card_on_file_data.to_h unless @subsequent_card_on_file_data.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'initialCardOnFileData'
                raise TypeError, "value '%s' is not a Hash" % [hash['initialCardOnFileData']] unless hash['initialCardOnFileData'].is_a? Hash
                @initial_card_on_file_data = Worldline::Acquiring::SDK::V1::Domain::InitialCardOnFileData.new_from_hash(hash['initialCardOnFileData'])
              end
              if hash.has_key? 'isInitialTransaction'
                @is_initial_transaction = hash['isInitialTransaction']
              end
              if hash.has_key? 'subsequentCardOnFileData'
                raise TypeError, "value '%s' is not a Hash" % [hash['subsequentCardOnFileData']] unless hash['subsequentCardOnFileData'].is_a? Hash
                @subsequent_card_on_file_data = Worldline::Acquiring::SDK::V1::Domain::SubsequentCardOnFileData.new_from_hash(hash['subsequentCardOnFileData'])
              end
            end
          end
        end
      end
    end
  end
end
