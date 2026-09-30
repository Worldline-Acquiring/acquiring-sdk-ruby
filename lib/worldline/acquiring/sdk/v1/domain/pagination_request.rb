#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [Integer] from_index
          # @attr [Integer] page_size
          # @attr [String] search_id
          class PaginationRequest < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :from_index

            attr_accessor :page_size

            attr_accessor :search_id

            # @return (Hash)
            def to_h
              hash = super
              hash['fromIndex'] = @from_index unless @from_index.nil?
              hash['pageSize'] = @page_size unless @page_size.nil?
              hash['searchId'] = @search_id unless @search_id.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'fromIndex'
                @from_index = hash['fromIndex']
              end
              if hash.has_key? 'pageSize'
                @page_size = hash['pageSize']
              end
              if hash.has_key? 'searchId'
                @search_id = hash['searchId']
              end
            end
          end
        end
      end
    end
  end
end
