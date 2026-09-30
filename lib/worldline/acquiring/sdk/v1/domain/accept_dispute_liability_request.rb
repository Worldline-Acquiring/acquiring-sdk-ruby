#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [true/false] include_entries
          # @attr [String] message_text
          # @attr [String] user_id
          class AcceptDisputeLiabilityRequest < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :include_entries

            attr_accessor :message_text

            attr_accessor :user_id

            # @return (Hash)
            def to_h
              hash = super
              hash['includeEntries'] = @include_entries unless @include_entries.nil?
              hash['messageText'] = @message_text unless @message_text.nil?
              hash['userId'] = @user_id unless @user_id.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'includeEntries'
                @include_entries = hash['includeEntries']
              end
              if hash.has_key? 'messageText'
                @message_text = hash['messageText']
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
