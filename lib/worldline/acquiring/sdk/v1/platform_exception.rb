#
# This file was automatically generated.
#
require_relative 'api_exception'

module Worldline
  module Acquiring
    module SDK
      module V1
        # Represents an error response from the Worldline Acquiring platform when something went wrong at the Worldline Acquiring platform or further downstream.
        class PlatformException < ApiException

          # Create a new PlatformException.
          # @see ApiException#initialize
          def initialize(status_code, response_body, type, title, status, detail, instance,
                         message='The Worldline Acquiring platform returned an error response')
            super(status_code, response_body, type, title, status, detail, instance, message)
          end
        end
      end
    end
  end
end
