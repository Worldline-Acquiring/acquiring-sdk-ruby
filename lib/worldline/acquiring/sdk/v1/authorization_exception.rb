#
# This file was automatically generated.
#
require_relative 'api_exception'

module Worldline
  module Acquiring
    module SDK
      module V1
        # Represents an error response from the Worldline Acquiring platform when API authorization failed.
        class AuthorizationException < ApiException

          # Create a new AuthorizationException.
          # @see ApiException#initialize
          def initialize(status_code, response_body, type, title, status, detail, instance,
                         message='The Worldline Acquiring platform returned an API authorization error response')
            super(status_code, response_body, type, title, status, detail, instance, message)
          end
        end
      end
    end
  end
end
