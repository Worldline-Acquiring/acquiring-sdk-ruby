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
          class DisputeDocumentIdItem < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :document_id

            # @return (Hash)
            def to_h
              hash = super
              hash['documentId'] = @document_id unless @document_id.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'documentId'
                @document_id = hash['documentId']
              end
            end
          end
        end
      end
    end
  end
end
