#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/api_resource'
require 'worldline/acquiring/sdk/communication/response_exception'
require 'worldline/acquiring/sdk/v1/exception_factory'
require 'worldline/acquiring/sdk/v1/domain/api_action_response_for_refund'
require 'worldline/acquiring/sdk/v1/domain/api_payment_error_response'
require 'worldline/acquiring/sdk/v1/domain/api_refund_resource'
require 'worldline/acquiring/sdk/v1/domain/api_refund_response'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Acquirer
          module Merchant
            module Refunds
              # Refunds client. Thread-safe.
              class RefundsClient < Worldline::Acquiring::SDK::ApiResource

                # @param parent       [Worldline::Acquiring::SDK::ApiResource]
                # @param path_context [Hash, nil]
                def initialize(parent, path_context)
                  super(parent: parent, path_context: path_context)
                end

                # Resource /processing/v1/!{acquirerId}/!{merchantId}/refunds - {https://docs.acquiring.worldline-solutions.com/api-reference#tag/Refunds/operation/processStandaloneRefund Create standalone refund}
                #
                # @param body    [Worldline::Acquiring::SDK::V1::Domain::ApiRefundRequest]
                # @param context [Worldline::Acquiring::SDK::CallContext, nil]
                # @return [Worldline::Acquiring::SDK::V1::Domain::ApiRefundResponse]
                # @raise [Worldline::Acquiring::SDK::V1::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
                # @raise [Worldline::Acquiring::SDK::V1::AuthorizationException] if the request was not allowed (HTTP status code 403)
                # @raise [Worldline::Acquiring::SDK::V1::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
                #        or there was a conflict (HTTP status code 404, 409 or 410)
                # @raise [Worldline::Acquiring::SDK::V1::PlatformException] if something went wrong at the Worldline Acquiring platform,
                #        the Worldline Acquiring platform was unable to process a message from a downstream partner/acquirer,
                #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
                # @raise [Worldline::Acquiring::SDK::V1::ApiException] if the Worldline Acquiring platform returned any other error
                def process_standalone_refund(body, context = nil)
                  uri = instantiate_uri('/processing/v1/{acquirerId}/{merchantId}/refunds', nil)
                  @communicator.post(
                    uri,
                nil,
                    nil,
                    body,
                    Worldline::Acquiring::SDK::V1::Domain::ApiRefundResponse,
                    context)
                rescue Worldline::Acquiring::SDK::Communication::ResponseException => e
                  error_type = Worldline::Acquiring::SDK::V1::Domain::ApiPaymentErrorResponse
                  error_object = @communicator.marshaller.unmarshal(e.body, error_type)
                  raise Worldline::Acquiring::SDK::V1.create_exception(e.status_code, e.body, error_object, context)
                end

                # Resource /processing/v1/!{acquirerId}/!{merchantId}/refunds/!{refundId} - {https://docs.acquiring.worldline-solutions.com/api-reference#tag/Refunds/operation/getRefund Retrieve refund}
                #
                # @param refund_id [String]
                # @param query     [Worldline::Acquiring::SDK::V1::Acquirer::Merchant::Refunds::GetRefundParams]
                # @param context   [Worldline::Acquiring::SDK::CallContext, nil]
                # @return [Worldline::Acquiring::SDK::V1::Domain::ApiRefundResource]
                # @raise [Worldline::Acquiring::SDK::V1::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
                # @raise [Worldline::Acquiring::SDK::V1::AuthorizationException] if the request was not allowed (HTTP status code 403)
                # @raise [Worldline::Acquiring::SDK::V1::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
                #        or there was a conflict (HTTP status code 404, 409 or 410)
                # @raise [Worldline::Acquiring::SDK::V1::PlatformException] if something went wrong at the Worldline Acquiring platform,
                #        the Worldline Acquiring platform was unable to process a message from a downstream partner/acquirer,
                #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
                # @raise [Worldline::Acquiring::SDK::V1::ApiException] if the Worldline Acquiring platform returned any other error
                def get_refund(refund_id, query, context = nil)
                  path_context = {
                    'refundId'.freeze => refund_id,
                  }
                  uri = instantiate_uri('/processing/v1/{acquirerId}/{merchantId}/refunds/{refundId}', path_context)
                  @communicator.get(
                    uri,
                nil,
                    query,
                    Worldline::Acquiring::SDK::V1::Domain::ApiRefundResource,
                    context)
                rescue Worldline::Acquiring::SDK::Communication::ResponseException => e
                  error_type = Worldline::Acquiring::SDK::V1::Domain::ApiPaymentErrorResponse
                  error_object = @communicator.marshaller.unmarshal(e.body, error_type)
                  raise Worldline::Acquiring::SDK::V1.create_exception(e.status_code, e.body, error_object, context)
                end

                # Resource /processing/v1/!{acquirerId}/!{merchantId}/refunds/!{refundId}/captures - {https://docs.acquiring.worldline-solutions.com/api-reference#tag/Refunds/operation/captureRefund Capture refund}
                #
                # @param refund_id [String]
                # @param body      [Worldline::Acquiring::SDK::V1::Domain::ApiCaptureRequestForRefund]
                # @param context   [Worldline::Acquiring::SDK::CallContext, nil]
                # @return [Worldline::Acquiring::SDK::V1::Domain::ApiActionResponseForRefund]
                # @raise [Worldline::Acquiring::SDK::V1::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
                # @raise [Worldline::Acquiring::SDK::V1::AuthorizationException] if the request was not allowed (HTTP status code 403)
                # @raise [Worldline::Acquiring::SDK::V1::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
                #        or there was a conflict (HTTP status code 404, 409 or 410)
                # @raise [Worldline::Acquiring::SDK::V1::PlatformException] if something went wrong at the Worldline Acquiring platform,
                #        the Worldline Acquiring platform was unable to process a message from a downstream partner/acquirer,
                #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
                # @raise [Worldline::Acquiring::SDK::V1::ApiException] if the Worldline Acquiring platform returned any other error
                def capture_refund(refund_id, body, context = nil)
                  path_context = {
                    'refundId'.freeze => refund_id,
                  }
                  uri = instantiate_uri('/processing/v1/{acquirerId}/{merchantId}/refunds/{refundId}/captures', path_context)
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

                # Resource /processing/v1/!{acquirerId}/!{merchantId}/refunds/!{refundId}/authorization-reversals - {https://docs.acquiring.worldline-solutions.com/api-reference#tag/Refunds/operation/reverseRefundAuthorization Reverse refund authorization}
                #
                # @param refund_id [String]
                # @param body      [Worldline::Acquiring::SDK::V1::Domain::ApiPaymentReversalRequest]
                # @param context   [Worldline::Acquiring::SDK::CallContext, nil]
                # @return [Worldline::Acquiring::SDK::V1::Domain::ApiActionResponseForRefund]
                # @raise [Worldline::Acquiring::SDK::V1::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
                # @raise [Worldline::Acquiring::SDK::V1::AuthorizationException] if the request was not allowed (HTTP status code 403)
                # @raise [Worldline::Acquiring::SDK::V1::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
                #        or there was a conflict (HTTP status code 404, 409 or 410)
                # @raise [Worldline::Acquiring::SDK::V1::PlatformException] if something went wrong at the Worldline Acquiring platform,
                #        the Worldline Acquiring platform was unable to process a message from a downstream partner/acquirer,
                #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
                # @raise [Worldline::Acquiring::SDK::V1::ApiException] if the Worldline Acquiring platform returned any other error
                def reverse_refund_authorization(refund_id, body, context = nil)
                  path_context = {
                    'refundId'.freeze => refund_id,
                  }
                  uri = instantiate_uri('/processing/v1/{acquirerId}/{merchantId}/refunds/{refundId}/authorization-reversals', path_context)
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
