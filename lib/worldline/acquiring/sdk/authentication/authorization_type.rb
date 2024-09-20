module Worldline
  module Acquiring
    module SDK
      module Authentication
        # Contains all authentication schemes supported by the Worldline Acquiring platform.
        class AuthorizationType
          OAUTH2 = "OAuth2".freeze

          # @return [String] the authorization string that belongs to the parameter _authorization_, or _nil_ if not found.
          def self.get_authorization(authorization)
            authorization if authorization == 'OAuth2'
          end
        end
      end
    end
  end
end
