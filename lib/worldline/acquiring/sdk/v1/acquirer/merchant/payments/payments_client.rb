#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/api_resource'
require 'worldline/acquiring/sdk/communication/response_exception'
require 'worldline/acquiring/sdk/v1/exception_factory'
require 'worldline/acquiring/sdk/v1/domain/api_action_response'
require 'worldline/acquiring/sdk/v1/domain/api_action_response_for_refund'
require 'worldline/acquiring/sdk/v1/domain/api_increment_response'
require 'worldline/acquiring/sdk/v1/domain/api_payment_error_response'
require 'worldline/acquiring/sdk/v1/domain/api_payment_resource'
require 'worldline/acquiring/sdk/v1/domain/api_payment_response'
require 'worldline/acquiring/sdk/v1/domain/api_reversal_response'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Acquirer
          module Merchant
            module Payments
              # Payments client. Thread-safe.
              class PaymentsClient < Worldline::Acquiring::SDK::ApiResource

                # @param parent       [Worldline::Acquiring::SDK::ApiResource]
                # @param path_context [Hash, nil]
                def initialize(parent, path_context)
                  super(parent: parent, path_context: path_context)
                end

                # Resource /processing/v1/!{acquirerId}/!{merchantId}/payments - {https://docs.acquiring.worldline-solutions.com/api-reference#tag/Payments/operation/processPayment Create payment}
                #
                # @param body    [Worldline::Acquiring::SDK::V1::Domain::ApiPaymentRequest]
                # @param context [Worldline::Acquiring::SDK::CallContext, nil]
                # @return [Worldline::Acquiring::SDK::V1::Domain::ApiPaymentResponse]
                # @raise [Worldline::Acquiring::SDK::V1::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
                # @raise [Worldline::Acquiring::SDK::V1::AuthorizationException] if the request was not allowed (HTTP status code 403)
                # @raise [Worldline::Acquiring::SDK::V1::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
                #        or there was a conflict (HTTP status code 404, 409 or 410)
                # @raise [Worldline::Acquiring::SDK::V1::PlatformException] if something went wrong at the Worldline Acquiring platform,
                #        the Worldline Acquiring platform was unable to process a message from a downstream partner/acquirer,
                #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
                # @raise [Worldline::Acquiring::SDK::V1::ApiException] if the Worldline Acquiring platform returned any other error
                def process_payment(body, context = nil)
                  uri = instantiate_uri('/processing/v1/{acquirerId}/{merchantId}/payments', nil)
                  @communicator.post(
                    uri,
                nil,
                    nil,
                    body,
                    Worldline::Acquiring::SDK::V1::Domain::ApiPaymentResponse,
                    context)
                rescue Worldline::Acquiring::SDK::Communication::ResponseException => e
                  error_type = Worldline::Acquiring::SDK::V1::Domain::ApiPaymentErrorResponse
                  error_object = @communicator.marshaller.unmarshal(e.body, error_type)
                  raise Worldline::Acquiring::SDK::V1.create_exception(e.status_code, e.body, error_object, context)
                end

                # Resource /processing/v1/!{acquirerId}/!{merchantId}/payments/!{paymentId} - {https://docs.acquiring.worldline-solutions.com/api-reference#tag/Payments/operation/getPaymentStatus Retrieve payment}
                #
                # @param payment_id [String]
                # @param query      [Worldline::Acquiring::SDK::V1::Acquirer::Merchant::Payments::GetPaymentStatusParams]
                # @param context    [Worldline::Acquiring::SDK::CallContext, nil]
                # @return [Worldline::Acquiring::SDK::V1::Domain::ApiPaymentResource]
                # @raise [Worldline::Acquiring::SDK::V1::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
                # @raise [Worldline::Acquiring::SDK::V1::AuthorizationException] if the request was not allowed (HTTP status code 403)
                # @raise [Worldline::Acquiring::SDK::V1::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
                #        or there was a conflict (HTTP status code 404, 409 or 410)
                # @raise [Worldline::Acquiring::SDK::V1::PlatformException] if something went wrong at the Worldline Acquiring platform,
                #        the Worldline Acquiring platform was unable to process a message from a downstream partner/acquirer,
                #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
                # @raise [Worldline::Acquiring::SDK::V1::ApiException] if the Worldline Acquiring platform returned any other error
                def get_payment_status(payment_id, query, context = nil)
                  path_context = {
                    'paymentId'.freeze => payment_id,
                  }
                  uri = instantiate_uri('/processing/v1/{acquirerId}/{merchantId}/payments/{paymentId}', path_context)
                  @communicator.get(
                    uri,
                nil,
                    query,
                    Worldline::Acquiring::SDK::V1::Domain::ApiPaymentResource,
                    context)
                rescue Worldline::Acquiring::SDK::Communication::ResponseException => e
                  error_type = Worldline::Acquiring::SDK::V1::Domain::ApiPaymentErrorResponse
                  error_object = @communicator.marshaller.unmarshal(e.body, error_type)
                  raise Worldline::Acquiring::SDK::V1.create_exception(e.status_code, e.body, error_object, context)
                end

                # Resource /processing/v1/!{acquirerId}/!{merchantId}/payments/!{paymentId}/captures - {https://docs.acquiring.worldline-solutions.com/api-reference#tag/Payments/operation/simpleCaptureOfPayment Capture payment}
                #
                # @param payment_id [String]
                # @param body       [Worldline::Acquiring::SDK::V1::Domain::ApiCaptureRequest]
                # @param context    [Worldline::Acquiring::SDK::CallContext, nil]
                # @return [Worldline::Acquiring::SDK::V1::Domain::ApiActionResponse]
                # @raise [Worldline::Acquiring::SDK::V1::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
                # @raise [Worldline::Acquiring::SDK::V1::AuthorizationException] if the request was not allowed (HTTP status code 403)
                # @raise [Worldline::Acquiring::SDK::V1::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
                #        or there was a conflict (HTTP status code 404, 409 or 410)
                # @raise [Worldline::Acquiring::SDK::V1::PlatformException] if something went wrong at the Worldline Acquiring platform,
                #        the Worldline Acquiring platform was unable to process a message from a downstream partner/acquirer,
                #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
                # @raise [Worldline::Acquiring::SDK::V1::ApiException] if the Worldline Acquiring platform returned any other error
                def simple_capture_of_payment(payment_id, body, context = nil)
                  path_context = {
                    'paymentId'.freeze => payment_id,
                  }
                  uri = instantiate_uri('/processing/v1/{acquirerId}/{merchantId}/payments/{paymentId}/captures', path_context)
                  @communicator.post(
                    uri,
                nil,
                    nil,
                    body,
                    Worldline::Acquiring::SDK::V1::Domain::ApiActionResponse,
                    context)
                rescue Worldline::Acquiring::SDK::Communication::ResponseException => e
                  error_type = Worldline::Acquiring::SDK::V1::Domain::ApiPaymentErrorResponse
                  error_object = @communicator.marshaller.unmarshal(e.body, error_type)
                  raise Worldline::Acquiring::SDK::V1.create_exception(e.status_code, e.body, error_object, context)
                end

                # Resource /processing/v1/!{acquirerId}/!{merchantId}/payments/!{paymentId}/authorization-reversals - {https://docs.acquiring.worldline-solutions.com/api-reference#tag/Payments/operation/reverseAuthorization Reverse authorization}
                #
                # @param payment_id [String]
                # @param body       [Worldline::Acquiring::SDK::V1::Domain::ApiPaymentReversalRequest]
                # @param context    [Worldline::Acquiring::SDK::CallContext, nil]
                # @return [Worldline::Acquiring::SDK::V1::Domain::ApiReversalResponse]
                # @raise [Worldline::Acquiring::SDK::V1::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
                # @raise [Worldline::Acquiring::SDK::V1::AuthorizationException] if the request was not allowed (HTTP status code 403)
                # @raise [Worldline::Acquiring::SDK::V1::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
                #        or there was a conflict (HTTP status code 404, 409 or 410)
                # @raise [Worldline::Acquiring::SDK::V1::PlatformException] if something went wrong at the Worldline Acquiring platform,
                #        the Worldline Acquiring platform was unable to process a message from a downstream partner/acquirer,
                #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
                # @raise [Worldline::Acquiring::SDK::V1::ApiException] if the Worldline Acquiring platform returned any other error
                def reverse_authorization(payment_id, body, context = nil)
                  path_context = {
                    'paymentId'.freeze => payment_id,
                  }
                  uri = instantiate_uri('/processing/v1/{acquirerId}/{merchantId}/payments/{paymentId}/authorization-reversals', path_context)
                  @communicator.post(
                    uri,
                nil,
                    nil,
                    body,
                    Worldline::Acquiring::SDK::V1::Domain::ApiReversalResponse,
                    context)
                rescue Worldline::Acquiring::SDK::Communication::ResponseException => e
                  error_type = Worldline::Acquiring::SDK::V1::Domain::ApiPaymentErrorResponse
                  error_object = @communicator.marshaller.unmarshal(e.body, error_type)
                  raise Worldline::Acquiring::SDK::V1.create_exception(e.status_code, e.body, error_object, context)
                end

                # Resource /processing/v1/!{acquirerId}/!{merchantId}/payments/!{paymentId}/increments - {https://docs.acquiring.worldline-solutions.com/api-reference#tag/Payments/operation/incrementPayment Increment authorization}
                #
                # @param payment_id [String]
                # @param body       [Worldline::Acquiring::SDK::V1::Domain::ApiIncrementRequest]
                # @param context    [Worldline::Acquiring::SDK::CallContext, nil]
                # @return [Worldline::Acquiring::SDK::V1::Domain::ApiIncrementResponse]
                # @raise [Worldline::Acquiring::SDK::V1::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
                # @raise [Worldline::Acquiring::SDK::V1::AuthorizationException] if the request was not allowed (HTTP status code 403)
                # @raise [Worldline::Acquiring::SDK::V1::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
                #        or there was a conflict (HTTP status code 404, 409 or 410)
                # @raise [Worldline::Acquiring::SDK::V1::PlatformException] if something went wrong at the Worldline Acquiring platform,
                #        the Worldline Acquiring platform was unable to process a message from a downstream partner/acquirer,
                #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
                # @raise [Worldline::Acquiring::SDK::V1::ApiException] if the Worldline Acquiring platform returned any other error
                def increment_payment(payment_id, body, context = nil)
                  path_context = {
                    'paymentId'.freeze => payment_id,
                  }
                  uri = instantiate_uri('/processing/v1/{acquirerId}/{merchantId}/payments/{paymentId}/increments', path_context)
                  @communicator.post(
                    uri,
                nil,
                    nil,
                    body,
                    Worldline::Acquiring::SDK::V1::Domain::ApiIncrementResponse,
                    context)
                rescue Worldline::Acquiring::SDK::Communication::ResponseException => e
                  error_type = Worldline::Acquiring::SDK::V1::Domain::ApiPaymentErrorResponse
                  error_object = @communicator.marshaller.unmarshal(e.body, error_type)
                  raise Worldline::Acquiring::SDK::V1.create_exception(e.status_code, e.body, error_object, context)
                end

                # Resource /processing/v1/!{acquirerId}/!{merchantId}/payments/!{paymentId}/refunds - {https://docs.acquiring.worldline-solutions.com/api-reference#tag/Payments/operation/createRefund Refund payment}
                #
                # @param payment_id [String]
                # @param body       [Worldline::Acquiring::SDK::V1::Domain::ApiPaymentRefundRequest]
                # @param context    [Worldline::Acquiring::SDK::CallContext, nil]
                # @return [Worldline::Acquiring::SDK::V1::Domain::ApiActionResponseForRefund]
                # @raise [Worldline::Acquiring::SDK::V1::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
                # @raise [Worldline::Acquiring::SDK::V1::AuthorizationException] if the request was not allowed (HTTP status code 403)
                # @raise [Worldline::Acquiring::SDK::V1::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
                #        or there was a conflict (HTTP status code 404, 409 or 410)
                # @raise [Worldline::Acquiring::SDK::V1::PlatformException] if something went wrong at the Worldline Acquiring platform,
                #        the Worldline Acquiring platform was unable to process a message from a downstream partner/acquirer,
                #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
                # @raise [Worldline::Acquiring::SDK::V1::ApiException] if the Worldline Acquiring platform returned any other error
                def create_refund(payment_id, body, context = nil)
                  path_context = {
                    'paymentId'.freeze => payment_id,
                  }
                  uri = instantiate_uri('/processing/v1/{acquirerId}/{merchantId}/payments/{paymentId}/refunds', path_context)
                  @communicator.post(
                    uri,
                nil,
                    nil,
                    body,
                    Worldline::Acquiring::SDK::V1::Domain::ApiActionResponseForRefund,
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
  end
end
