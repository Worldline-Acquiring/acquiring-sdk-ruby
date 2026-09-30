#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] document_id
          # @attr [String] file_name
          # @attr [String] mime_type
          class DisputeDocument < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :document_id

            attr_accessor :file_name

            attr_accessor :mime_type

            # @return (Hash)
            def to_h
              hash = super
              hash['documentId'] = @document_id unless @document_id.nil?
              hash['fileName'] = @file_name unless @file_name.nil?
              hash['mimeType'] = @mime_type unless @mime_type.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'documentId'
                @document_id = hash['documentId']
              end
              if hash.has_key? 'fileName'
                @file_name = hash['fileName']
              end
              if hash.has_key? 'mimeType'
                @mime_type = hash['mimeType']
              end
            end
          end
        end
      end
    end
  end
end
