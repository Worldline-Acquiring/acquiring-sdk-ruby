module Worldline
  module Acquiring
    module SDK
      module Communication
        # A representation of a multipart/form-data request
        class MultipartFormDataRequest
          # @return [Worldline::Acquiring::SDK::Communication::MultipartFormDataObject]
          def to_multipart_form_data_object
            raise NotImplementedError
          end
        end
      end
    end
  end
end
