#
# This file was automatically generated.
#
require_relative 'api_exception'
require_relative 'authorization_exception'
require_relative 'platform_exception'
require_relative 'reference_exception'
require_relative 'validation_exception'

require 'worldline/acquiring/sdk/v1/domain/api_payment_error_response'

module Worldline
  module Acquiring
    module SDK
      module V1
        def self.create_exception(status_code, response_body, error_object, context)
          raise ArgumentError.new("unsupported error object type: " + error_object.class.name) unless error_object.is_a?(Worldline::Acquiring::SDK::V1::Domain::ApiPaymentErrorResponse)
          create_exception_from_response_fields(status_code, response_body, error_object.type, error_object.title, error_object.status, error_object.detail, error_object.instance, context)
        end

        private

        def self.create_exception_from_response_fields(status_code, response_body, type, title, status, detail, instance, context)
          case status_code
            when 400
              return ValidationException.new(status_code, response_body, type, title, status, detail, instance)
            when 403
              return AuthorizationException.new(status_code, response_body, type, title, status, detail, instance)
            when 404
              return ReferenceException.new(status_code, response_body, type, title, status, detail, instance)
            when 409
              return ReferenceException.new(status_code, response_body, type, title, status, detail, instance)
            when 410
              return ReferenceException.new(status_code, response_body, type, title, status, detail, instance)
            when 500
              return PlatformException.new(status_code, response_body, type, title, status, detail, instance)
            when 502
              return PlatformException.new(status_code, response_body, type, title, status, detail, instance)
            when 503
              return PlatformException.new(status_code, response_body, type, title, status, detail, instance)
            else
              return ApiException.new(status_code, response_body, type, title, status, detail, instance)
          end
        end
      end
    end
  end
end
