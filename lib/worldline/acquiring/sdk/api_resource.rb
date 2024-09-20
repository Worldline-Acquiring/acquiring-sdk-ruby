module Worldline
  module Acquiring
    module SDK
      # Base class of all Worldline Acquiring platform API resources.
      # Provides shared functionality to facilitate communication with the Worldline Acquiring platform.
      #
      # @attr_reader [Worldline::Acquiring::SDK::Communicator] communicator Communicator instance that provides communication with the Worldline Acquiring platform.
      class ApiResource

        # Creates a new ApiResource.
        #
        # @param parent           [Worldline::Acquiring::SDK::ApiResource] parent resource instance.
        # @param communicator     [Worldline::Acquiring::SDK::Communicator] Communicator instance.
        # @param path_context     [Hash] hash that contains substitutions for generic locations in the URL path.
        #                         This hash will be used to instantiate a concrete URL used to access specific resources.
        def initialize(parent: nil, communicator: nil, path_context: nil)
          raise ArgumentError.new('parent and/or communicator is required') if parent.nil? and communicator.nil?
          @parent = parent
          @communicator = communicator.nil? ? parent.communicator : communicator
          @path_context = path_context
        end

        attr_reader :communicator

        protected

        def instantiate_uri(uri, path_context = nil)
          if path_context
            uri = replace_all(uri, path_context)
            instantiate_uri(uri)
          else
            uri = replace_all(uri, @path_context)
            unless @parent.nil?
              uri = @parent.instantiate_uri(uri)
            end
            uri
          end
        end

        private

        def replace_all(uri, path_context)
          if path_context
            path_context.each do |key, value|
              uri = uri.gsub('{' + key + '}', value)
            end
          end
          uri
        end
      end
    end
  end
end
