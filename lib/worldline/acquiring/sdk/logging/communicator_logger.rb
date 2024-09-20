module Worldline
  module Acquiring
    module SDK
      module Logging
        # Base logger class used in this SDK. This class is an interface and cannot be instantiated.
        class CommunicatorLogger

          # Interface, no instantiation
          # @see Worldline::Acquiring::SDK::Logging::StdoutCommunicatorLogger
          # @see Worldline::Acquiring::SDK::Logging::RubyCommunicatorLogger
          def initialize
            raise NotImplementedError.new("#{self.class.name} is not implemented.")
          end

          # Logs a message with or without exception
          #
          # @param message [String] the message to log
          # @param thrown  [Exception, nil] the exception to log, or nil to log no exception
          def log(message, thrown = nil)
            raise NotImplementedError.new("#{self.class.name}#log() is not implemented.")
          end
        end
      end
    end
  end
end
