#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/communication/multipart_form_data_object'
require 'worldline/acquiring/sdk/communication/multipart_form_data_request'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Disputedocuments
          # Multipart/form-data parameters for {https://docs.acquiring.worldline-solutions.com/api-reference#tag/Dispute-Documents/operation/uploadDisputeDocument Upload Dispute Document}
          #
          # @attr [Worldline::Acquiring::SDK::Domain::UploadableFile] file
          class UploadDisputeDocumentRequest < Worldline::Acquiring::SDK::Communication::MultipartFormDataRequest

            attr_accessor :file

            # @return [Worldline::Acquiring::SDK::Communication::MultipartFormDataObject] representing the attributes of this class
            def to_multipart_form_data_object
              result = MultipartFormDataObject.new
              result.add_file('file', @file) unless @file.nil?
              result
            end
          end
        end
      end
    end
  end
end
