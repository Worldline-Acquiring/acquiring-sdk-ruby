#
# This file was automatically generated.
#
require 'worldline/acquiring/sdk/domain/data_object'

module Worldline
  module Acquiring
    module SDK
      module V1
        module Domain
          # @attr [String] masked_identifier
          # @attr [String] scheme
          # @attr [String] scheme_brand
          class PaymentMethodDataBase < Worldline::Acquiring::SDK::Domain::DataObject

            attr_accessor :masked_identifier

            attr_accessor :scheme

            attr_accessor :scheme_brand

            # @return (Hash)
            def to_h
              hash = super
              hash['maskedIdentifier'] = @masked_identifier unless @masked_identifier.nil?
              hash['scheme'] = @scheme unless @scheme.nil?
              hash['schemeBrand'] = @scheme_brand unless @scheme_brand.nil?
              hash
            end

            def from_hash(hash)
              super
              if hash.has_key? 'maskedIdentifier'
                @masked_identifier = hash['maskedIdentifier']
              end
              if hash.has_key? 'scheme'
                @scheme = hash['scheme']
              end
              if hash.has_key? 'schemeBrand'
                @scheme_brand = hash['schemeBrand']
              end
            end
          end
        end
      end
    end
  end
end
