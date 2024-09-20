#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/api_resource'
require 'worldline/acquiring/sdk/communication/response_exception'
require 'worldline/acquiring/sdk/v1/exception_factory'
require 'worldline/acquiring/sdk/v1/domain/api_payment_error_response'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Ping
          # Ping client. Thread-safe.
          class PingClient < Worldline::Acquiring::SDK::ApiResource

            # @param parent       [Worldline::Acquiring::SDK::ApiResource]
            # @param path_context [Hash, nil]
            def initialize(parent, path_context)
              super(parent: parent, path_context: path_context)
            end

            # Resource /services/v1/ping - {https://docs.acquiring.worldline-solutions.com/api-reference#tag/Ping/operation/ping Check API connection}
            #
            # @param context [Worldline::Acquiring::SDK::CallContext, nil]
            # @raise [Worldline::Acquiring::SDK::V1::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
            # @raise [Worldline::Acquiring::SDK::V1::AuthorizationException] if the request was not allowed (HTTP status code 403)
            # @raise [Worldline::Acquiring::SDK::V1::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
            #        or there was a conflict (HTTP status code 404, 409 or 410)
            # @raise [Worldline::Acquiring::SDK::V1::PlatformException] if something went wrong at the Worldline Acquiring platform,
            #        the Worldline Acquiring platform was unable to process a message from a downstream partner/acquirer,
            #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
            # @raise [Worldline::Acquiring::SDK::V1::ApiException] if the Worldline Acquiring platform returned any other error
            def ping(context = nil)
              uri = instantiate_uri('/services/v1/ping', nil)
              @communicator.get(
                uri,
                nil,
                nil,
                nil,
                context)
            rescue Worldline::Acquiring::SDK::Communication::ResponseException => e
              error_type = Worldline::Acquiring::SDK::V1::Domain::ApiPaymentErrorResponse
              error_object = @communicator.marshaller.unmarshal(e.body, error_type)
              raise Worldline::Acquiring::SDK::V1.create_exception(e.status_code, e.body, error_object, context)
            end
          end
        end
      end
    end
  end
end
