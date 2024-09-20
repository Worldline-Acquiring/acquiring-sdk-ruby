module Worldline
  module Acquiring
    module SDK
      module Communication
        # Class that represents the URL request parameters.
        # Contains a method to add a name and value pair to a parameter array as a {Worldline::Acquiring::SDK::Communication::RequestParam}.
        class ParamRequest
          # @return [Array<Worldline::Acquiring::SDK::Communication::RequestParam>]
          def to_request_parameters
            raise NotImplementedError
          end
        end
      end
    end
  end
end
