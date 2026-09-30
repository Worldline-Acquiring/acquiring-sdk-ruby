#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/api_resource'
require 'worldline/acquiring/sdk/communication/response_exception'
require 'worldline/acquiring/sdk/v1/exception_factory'
require 'worldline/acquiring/sdk/v1/domain/api_payment_error_response'
require 'worldline/acquiring/sdk/v1/domain/dispute_response'
require 'worldline/acquiring/sdk/v1/domain/search_disputes_response'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Disputemanagement
          # DisputeManagement client. Thread-safe.
          class DisputeManagementClient < Worldline::Acquiring::SDK::ApiResource

            # @param parent       [Worldline::Acquiring::SDK::ApiResource]
            # @param path_context [Hash, nil]
            def initialize(parent, path_context)
              super(parent: parent, path_context: path_context)
            end

            # Resource /dispute-management/v1/disputes/search - {https://docs.acquiring.worldline-solutions.com/api-reference#tag/Dispute-Management/operation/searchDisputes Search Disputes}
            #
            # @param body    [Worldline::Acquiring::SDK::V1::Domain::SearchDisputesRequest]
            # @param context [Worldline::Acquiring::SDK::CallContext, nil]
            # @return [Worldline::Acquiring::SDK::V1::Domain::SearchDisputesResponse]
            # @raise [Worldline::Acquiring::SDK::V1::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
            # @raise [Worldline::Acquiring::SDK::V1::AuthorizationException] if the request was not allowed (HTTP status code 403)
            # @raise [Worldline::Acquiring::SDK::V1::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
            #        or there was a conflict (HTTP status code 404, 409 or 410)
            # @raise [Worldline::Acquiring::SDK::V1::PlatformException] if something went wrong at the Worldline Acquiring platform,
            #        the Worldline Acquiring platform was unable to process a message from a downstream partner/acquirer,
            #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
            # @raise [Worldline::Acquiring::SDK::V1::ApiException] if the Worldline Acquiring platform returned any other error
            def search_disputes(body, context = nil)
              uri = instantiate_uri('/dispute-management/v1/disputes/search', nil)
              @communicator.post(
                uri,
                nil,
                nil,
                body,
                Worldline::Acquiring::SDK::V1::Domain::SearchDisputesResponse,
                context)
            rescue Worldline::Acquiring::SDK::Communication::ResponseException => e
              error_type = Worldline::Acquiring::SDK::V1::Domain::ApiPaymentErrorResponse
              error_object = @communicator.marshaller.unmarshal(e.body, error_type)
              raise Worldline::Acquiring::SDK::V1.create_exception(e.status_code, e.body, error_object, context)
            end

            # Resource /dispute-management/v1/disputes/!{disputeId} - {https://docs.acquiring.worldline-solutions.com/api-reference#tag/Dispute-Management/operation/getDispute Retrieve Dispute}
            #
            # @param dispute_id [String]
            # @param query      [Worldline::Acquiring::SDK::V1::Disputemanagement::GetDisputeParams]
            # @param context    [Worldline::Acquiring::SDK::CallContext, nil]
            # @return [Worldline::Acquiring::SDK::V1::Domain::DisputeResponse]
            # @raise [Worldline::Acquiring::SDK::V1::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
            # @raise [Worldline::Acquiring::SDK::V1::AuthorizationException] if the request was not allowed (HTTP status code 403)
            # @raise [Worldline::Acquiring::SDK::V1::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
            #        or there was a conflict (HTTP status code 404, 409 or 410)
            # @raise [Worldline::Acquiring::SDK::V1::PlatformException] if something went wrong at the Worldline Acquiring platform,
            #        the Worldline Acquiring platform was unable to process a message from a downstream partner/acquirer,
            #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
            # @raise [Worldline::Acquiring::SDK::V1::ApiException] if the Worldline Acquiring platform returned any other error
            def get_dispute(dispute_id, query, context = nil)
              path_context = {
                'disputeId'.freeze => dispute_id,
              }
              uri = instantiate_uri('/dispute-management/v1/disputes/{disputeId}', path_context)
              @communicator.get(
                uri,
                nil,
                query,
                Worldline::Acquiring::SDK::V1::Domain::DisputeResponse,
                context)
            rescue Worldline::Acquiring::SDK::Communication::ResponseException => e
              error_type = Worldline::Acquiring::SDK::V1::Domain::ApiPaymentErrorResponse
              error_object = @communicator.marshaller.unmarshal(e.body, error_type)
              raise Worldline::Acquiring::SDK::V1.create_exception(e.status_code, e.body, error_object, context)
            end

            # Resource /dispute-management/v1/disputes/!{disputeId}/accept - {https://docs.acquiring.worldline-solutions.com/api-reference#tag/Dispute-Management/operation/acceptDisputeLiability Accept Liability}
            #
            # @param dispute_id [String]
            # @param body       [Worldline::Acquiring::SDK::V1::Domain::AcceptDisputeLiabilityRequest]
            # @param context    [Worldline::Acquiring::SDK::CallContext, nil]
            # @return [Worldline::Acquiring::SDK::V1::Domain::DisputeResponse]
            # @raise [Worldline::Acquiring::SDK::V1::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
            # @raise [Worldline::Acquiring::SDK::V1::AuthorizationException] if the request was not allowed (HTTP status code 403)
            # @raise [Worldline::Acquiring::SDK::V1::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
            #        or there was a conflict (HTTP status code 404, 409 or 410)
            # @raise [Worldline::Acquiring::SDK::V1::PlatformException] if something went wrong at the Worldline Acquiring platform,
            #        the Worldline Acquiring platform was unable to process a message from a downstream partner/acquirer,
            #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
            # @raise [Worldline::Acquiring::SDK::V1::ApiException] if the Worldline Acquiring platform returned any other error
            def accept_dispute_liability(dispute_id, body, context = nil)
              path_context = {
                'disputeId'.freeze => dispute_id,
              }
              uri = instantiate_uri('/dispute-management/v1/disputes/{disputeId}/accept', path_context)
              @communicator.post(
                uri,
                nil,
                nil,
                body,
                Worldline::Acquiring::SDK::V1::Domain::DisputeResponse,
                context)
            rescue Worldline::Acquiring::SDK::Communication::ResponseException => e
              error_type = Worldline::Acquiring::SDK::V1::Domain::ApiPaymentErrorResponse
              error_object = @communicator.marshaller.unmarshal(e.body, error_type)
              raise Worldline::Acquiring::SDK::V1.create_exception(e.status_code, e.body, error_object, context)
            end

            # Resource /dispute-management/v1/disputes/!{disputeId}/submit-evidence - {https://docs.acquiring.worldline-solutions.com/api-reference#tag/Dispute-Management/operation/submitEvidence Submit Evidence}
            #
            # @param dispute_id [String]
            # @param body       [Worldline::Acquiring::SDK::V1::Domain::SubmitEvidenceRequest]
            # @param context    [Worldline::Acquiring::SDK::CallContext, nil]
            # @return [Worldline::Acquiring::SDK::V1::Domain::DisputeResponse]
            # @raise [Worldline::Acquiring::SDK::V1::ValidationException] if the request was not correct and couldn't be processed (HTTP status code 400)
            # @raise [Worldline::Acquiring::SDK::V1::AuthorizationException] if the request was not allowed (HTTP status code 403)
            # @raise [Worldline::Acquiring::SDK::V1::ReferenceException] if an object was attempted to be referenced that doesn't exist or has been removed,
            #        or there was a conflict (HTTP status code 404, 409 or 410)
            # @raise [Worldline::Acquiring::SDK::V1::PlatformException] if something went wrong at the Worldline Acquiring platform,
            #        the Worldline Acquiring platform was unable to process a message from a downstream partner/acquirer,
            #        or the service that you're trying to reach is temporary unavailable (HTTP status code 500, 502 or 503)
            # @raise [Worldline::Acquiring::SDK::V1::ApiException] if the Worldline Acquiring platform returned any other error
            def submit_evidence(dispute_id, body, context = nil)
              path_context = {
                'disputeId'.freeze => dispute_id,
              }
              uri = instantiate_uri('/dispute-management/v1/disputes/{disputeId}/submit-evidence', path_context)
              @communicator.post(
                uri,
                nil,
                nil,
                body,
                Worldline::Acquiring::SDK::V1::Domain::DisputeResponse,
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
