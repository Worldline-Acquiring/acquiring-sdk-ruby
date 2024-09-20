#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] authentication_value
          # @attr [String] directory_server_transaction_id
          # @attr [String] eci
          # @attr [String] three_d_secure_type
          # @attr [String] version
          class ThreeDSecure < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :authentication_value

            attr_accessor :directory_server_transaction_id

            attr_accessor :eci

            attr_accessor :three_d_secure_type

            attr_accessor :version

            # @return (Hash)
            def to_h
              hash = super
              hash['authenticationValue'] = @authentication_value unless @authentication_value.nil?
              hash['directoryServerTransactionId'] = @directory_server_transaction_id unless @directory_server_transaction_id.nil?
              hash['eci'] = @eci unless @eci.nil?
              hash['threeDSecureType'] = @three_d_secure_type unless @three_d_secure_type.nil?
              hash['version'] = @version unless @version.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'authenticationValue'
                @authentication_value = hash['authenticationValue']
              end
              if hash.has_key? 'directoryServerTransactionId'
                @directory_server_transaction_id = hash['directoryServerTransactionId']
              end
              if hash.has_key? 'eci'
                @eci = hash['eci']
              end
              if hash.has_key? 'threeDSecureType'
                @three_d_secure_type = hash['threeDSecureType']
              end
              if hash.has_key? 'version'
                @version = hash['version']
              end
            end
          end
        end
      end
    end
  end
end
