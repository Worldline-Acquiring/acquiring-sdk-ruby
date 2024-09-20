module Worldline
  module Acquiring
    module SDK
      module Authentication
        # Raised when an exception regarding the authorization with the Worldline OAuth2 Authorization Server occurs.
        class OAuth2Exception < RuntimeError

          def initialize(message)
            super(message)
          end
        end
      end
    end
  end
end
