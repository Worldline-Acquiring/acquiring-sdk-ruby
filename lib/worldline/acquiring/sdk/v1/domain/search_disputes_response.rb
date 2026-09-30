#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'
require 'worldline/acquiring/sdk/v1/domain/dispute_case'
require 'worldline/acquiring/sdk/v1/domain/pagination_response'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Array<Worldline::Acquiring::SDK::V1::Domain::DisputeCase>] disputes
          # @attr [Worldline::Acquiring::SDK::V1::Domain::PaginationResponse] pagination
          # @attr [String] request_id
          class SearchDisputesResponse < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :disputes

            attr_accessor :pagination

            attr_accessor :request_id

            # @return (Hash)
            def to_h
              hash = super
              hash['disputes'] = @disputes.collect{|val| val.to_h} unless @disputes.nil?
              hash['pagination'] = @pagination.to_h unless @pagination.nil?
              hash['requestId'] = @request_id unless @request_id.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'disputes'
                raise TypeError, "value '%s' is not an Array" % [hash['disputes']] unless hash['disputes'].is_a? Array
                @disputes = []
                hash['disputes'].each do |e|
                  @disputes << Worldline::Acquiring::SDK::V1::Domain::DisputeCase.new_from_hash(e)
                end
              end
              if hash.has_key? 'pagination'
                raise TypeError, "value '%s' is not a Hash" % [hash['pagination']] unless hash['pagination'].is_a? Hash
                @pagination = Worldline::Acquiring::SDK::V1::Domain::PaginationResponse.new_from_hash(hash['pagination'])
              end
              if hash.has_key? 'requestId'
                @request_id = hash['requestId']
              end
            end
          end
        end
      end
    end
  end
end
