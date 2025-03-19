#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [true/false] allow_single_tap
          # @attr [Array<String>] card_reading_capabilities
          # @attr [String] cardholder_activated_terminal_level
          # @attr [true/false] is_attended_terminal
          # @attr [true/false] is_offline_approved
          # @attr [String] offline_authorization_response_code
          # @attr [String] pin_entry_capability
          # @attr [String] terminal_id
          # @attr [String] terminal_location
          class TerminalData < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :allow_single_tap

            attr_accessor :card_reading_capabilities

            attr_accessor :cardholder_activated_terminal_level

            attr_accessor :is_attended_terminal

            attr_accessor :is_offline_approved

            attr_accessor :offline_authorization_response_code

            attr_accessor :pin_entry_capability

            attr_accessor :terminal_id

            attr_accessor :terminal_location

            # @return (Hash)
            def to_h
              hash = super
              hash['allowSingleTap'] = @allow_single_tap unless @allow_single_tap.nil?
              hash['cardReadingCapabilities'] = @card_reading_capabilities unless @card_reading_capabilities.nil?
              hash['cardholderActivatedTerminalLevel'] = @cardholder_activated_terminal_level unless @cardholder_activated_terminal_level.nil?
              hash['isAttendedTerminal'] = @is_attended_terminal unless @is_attended_terminal.nil?
              hash['isOfflineApproved'] = @is_offline_approved unless @is_offline_approved.nil?
              hash['offlineAuthorizationResponseCode'] = @offline_authorization_response_code unless @offline_authorization_response_code.nil?
              hash['pinEntryCapability'] = @pin_entry_capability unless @pin_entry_capability.nil?
              hash['terminalId'] = @terminal_id unless @terminal_id.nil?
              hash['terminalLocation'] = @terminal_location unless @terminal_location.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'allowSingleTap'
                @allow_single_tap = hash['allowSingleTap']
              end
              if hash.has_key? 'cardReadingCapabilities'
                raise TypeError, "value '%s' is not an Array" % [hash['cardReadingCapabilities']] unless hash['cardReadingCapabilities'].is_a? Array
                @card_reading_capabilities = []
                hash['cardReadingCapabilities'].each do |e|
                  @card_reading_capabilities << e
                end
              end
              if hash.has_key? 'cardholderActivatedTerminalLevel'
                @cardholder_activated_terminal_level = hash['cardholderActivatedTerminalLevel']
              end
              if hash.has_key? 'isAttendedTerminal'
                @is_attended_terminal = hash['isAttendedTerminal']
              end
              if hash.has_key? 'isOfflineApproved'
                @is_offline_approved = hash['isOfflineApproved']
              end
              if hash.has_key? 'offlineAuthorizationResponseCode'
                @offline_authorization_response_code = hash['offlineAuthorizationResponseCode']
              end
              if hash.has_key? 'pinEntryCapability'
                @pin_entry_capability = hash['pinEntryCapability']
              end
              if hash.has_key? 'terminalId'
                @terminal_id = hash['terminalId']
              end
              if hash.has_key? 'terminalLocation'
                @terminal_location = hash['terminalLocation']
              end
            end
          end
        end
      end
    end
  end
end
