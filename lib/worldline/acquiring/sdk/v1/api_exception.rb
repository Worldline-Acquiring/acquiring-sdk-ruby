#
# This file was automatically generated.
#
module Worldline
  module Acquiring
    module SDK
      module V1
        # Represents an error response from the Worldline Acquiring platform.
        #
        # @attr_reader [Integer] status_code   HTTP status code of the returned response.
        # @attr_reader [String]  response_body Message body of the returned response.
        # @attr_reader [String] type The _type_ received from the Worldline Acquiring platform if available.
        # @attr_reader [String] title The _title_ received from the Worldline Acquiring platform if available.
        # @attr_reader [Integer] status The _status_ received from the Worldline Acquiring platform if available.
        # @attr_reader [String] detail The _detail_ received from the Worldline Acquiring platform if available.
        # @attr_reader [String] instance The _instance_ received from the Worldline Acquiring platform if available.
        class ApiException < RuntimeError

          # Creates a new ApiException that reports an error response from the Worldline Acquiring platform.
          #
          # @param status_code   (Integer) HTTP status code the response
          # @param response_body (String) HTTP response body
          # @param type          (String) The _type_ received from the Worldline Acquiring platform
          # @param title         (String) The _title_ received from the Worldline Acquiring platform
          # @param status        (Integer) The _status_ received from the Worldline Acquiring platform
          # @param detail        (String) The _detail_ received from the Worldline Acquiring platform
          # @param instance      (String) The _instance_ received from the Worldline Acquiring platform
          # @param message       (String) error message to include
          def initialize(status_code, response_body, type, title, status, detail, instance,
                         message='The Worldline Acquiring platform returned an error response')
            super(message)
            @status_code = status_code
            @response_body = response_body
            @type = type
            @title = title
            @status = status
            @detail = detail
            @instance = instance
          end

          attr_reader :status_code
          attr_reader :response_body
          attr_reader :type
          attr_reader :title
          attr_reader :status
          attr_reader :detail
          attr_reader :instance

          def to_s
            str = super.to_s
            if @status_code > 0
              str += '; status_code=' + @status_code.to_s
            end
            if !@response_body.nil? && @response_body.length > 0
              str += "; response_body='" + @response_body + "'"
            end
            str.to_s
          end
        end
      end
    end
  end
end
