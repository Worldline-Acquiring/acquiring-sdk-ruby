require 'rspec'
require 'webmock/rspec'

require 'worldline/acquiring/sdk'
require 'comparable_extension'

RSpec.configure do |config|

  WebMock.disable_net_connect! # make it explicit

  config.order = 'random'
  config.profile_examples = 5 # show the slowest tests

  # declaration of constants to use throughout the tests
  config.before(:suite) do
    class MockAuthenticator < Worldline::Acquiring::SDK::Authentication::Authenticator
      def get_authorization(http_method, resource_uri, request_headers)
        'ignored'
      end
    end

    PROPERTIES_URI_OAUTH2 = File.expand_path('../../spec/fixtures/resources/properties.oauth2.yml', __FILE__)
    OAUTH2_CLIENT_ID = 'someId'
    OAUTH2_CLIENT_SECRET = 'someSecret'
    authenticator = MockAuthenticator.new
    COMMUNICATOR = Worldline::Acquiring::SDK::Factory.create_communicator_from_file(PROPERTIES_URI_OAUTH2, OAUTH2_CLIENT_ID, OAUTH2_CLIENT_SECRET,
                                                                                    authenticator: authenticator)
    CLIENT = Worldline::Acquiring::SDK::Factory.create_client_from_communicator(COMMUNICATOR)
  end

  config.after(:suite) { CLIENT.close }
end
