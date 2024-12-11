#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] pan_last4_digits
          # @attr [Integer] pin_retry_counter
          class PointOfSaleDataForResponse < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :pan_last4_digits

            attr_accessor :pin_retry_counter

            # @return (Hash)
            def to_h
              hash = super
              hash['panLast4Digits'] = @pan_last4_digits unless @pan_last4_digits.nil?
              hash['pinRetryCounter'] = @pin_retry_counter unless @pin_retry_counter.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'panLast4Digits'
                @pan_last4_digits = hash['panLast4Digits']
              end
              if hash.has_key? 'pinRetryCounter'
                @pin_retry_counter = hash['pinRetryCounter']
              end
            end
          end
        end
      end
    end
  end
end
