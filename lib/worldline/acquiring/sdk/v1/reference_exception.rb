#
# This file was automatically generated.
#
require_relative 'api_exception'

module Worldline
  module Acquiring
    module SDK
      module V1
        # Represents an error response from the Worldline Acquiring platform when a non-existing or removed object is trying to be accessed.
        class ReferenceException < ApiException

          # Create a new ReferenceException.
          # @see ApiException#initialize
          def initialize(status_code, response_body, type, title, status, detail, instance,
                         message='The Worldline Acquiring platform returned a reference error response')
            super(status_code, response_body, type, title, status, detail, instance, message)
          end
        end
      end
    end
  end
end
