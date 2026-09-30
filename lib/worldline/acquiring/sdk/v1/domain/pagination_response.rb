#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Integer] last_index
          # @attr [String] search_id
          # @attr [Integer] total_count
          class PaginationResponse < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :last_index

            attr_accessor :search_id

            attr_accessor :total_count

            # @return (Hash)
            def to_h
              hash = super
              hash['lastIndex'] = @last_index unless @last_index.nil?
              hash['searchId'] = @search_id unless @search_id.nil?
              hash['totalCount'] = @total_count unless @total_count.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'lastIndex'
                @last_index = hash['lastIndex']
              end
              if hash.has_key? 'searchId'
                @search_id = hash['searchId']
              end
              if hash.has_key? 'totalCount'
                @total_count = hash['totalCount']
              end
            end
          end
        end
      end
    end
  end
end
