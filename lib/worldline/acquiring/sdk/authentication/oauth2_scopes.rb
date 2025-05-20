#
# This file was automatically generated.
#
module Worldline
  module Acquiring
    module SDK
      module Authentication
        module OAuth2Scopes
          private

          SCOPES_BY_OPERATION = {
            "v1" => {
              "processPayment" => ["processing_payment"],
              "getPaymentStatus" => ["processing_payment"],
              "simpleCaptureOfPayment" => ["processing_payment"],
              "reverseAuthorization" => ["processing_payment"],
              "incrementPayment" => ["processing_payment"],
              "createRefund" => ["processing_refund"],
              "processStandaloneRefund" => ["processing_refund"],
              "getRefund" => ["processing_refund"],
              "captureRefund" => ["processing_refund"],
              "reverseRefundAuthorization" => ["processing_refund"],
              "processAccountVerification" => ["processing_accountverification"],
              "processBalanceInquiry" => ["processing_balanceinquiry"],
              "technicalReversal" => ["processing_operation_reverse"],
              "requestDccRate" => ["processing_dcc_rate"],
              "ping" => ["services_ping"]
            }
          }

          ALL_SCOPES = SCOPES_BY_OPERATION.values.map { |m| m.values }.flatten.uniq.freeze

          public

          # Returns all available scopes.
          def self.all
            ALL_SCOPES
          end

          # Returns all scopes needed for all operations of the given API version.
          def self.for_api_version(api_version)
            operations = SCOPES_BY_OPERATION[api_version] || {}
            operations.values.flatten.uniq.freeze
          end

          # Returns all scopes needed for the given operation of the given API version.
          def self.for_operation(api_version, operation_id)
            operations = SCOPES_BY_OPERATION[api_version] || {}
            scopes = operations[operation_id] || []
            scopes.uniq.freeze
          end

          # Returns all scopes needed for the given operations of the given API version.
          def self.for_operations(api_version, *operation_ids)
            operations = SCOPES_BY_OPERATION[api_version] || {}
            operation_ids.map { |operation_id| operations[operation_id] || [] }.flatten.uniq.freeze
          end

          # Returns all scopes needed for the operations that pass the given filter.
          # The first argument to the filter is the API version, the second is the operation id.
          def self.for_filtered_operations(filter)
            SCOPES_BY_OPERATION.keys.map { |api_version|
              operations = SCOPES_BY_OPERATION[api_version]
              operations.keys
                        .filter { |operation_id| filter.call(api_version, operation_id) }
                        .map { |operation_id| operations[operation_id] }
            }.flatten.uniq.freeze
          end
        end
      end
    end
  end
end
