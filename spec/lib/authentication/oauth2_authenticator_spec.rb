require 'uri'
require 'spec_helper'
require 'securerandom'

describe 'OAuth2Authenticator' do
  resource_prefix = 'spec/fixtures/resources/authentication/'

  OAuth2Exception = Worldline::Acquiring::SDK::Authentication::OAuth2Exception

  before do
    $configuration = Worldline::Acquiring::SDK::Factory.create_configuration(PROPERTIES_URI_OAUTH2,
                                                                             SecureRandom.uuid,
                                                                             SecureRandom.uuid)
  end

  it 'should retrieve the access token successfully' do
    response_body = IO.read(resource_prefix + 'oauth2AccessToken.json')

    stub_request(:post, $configuration.oauth2_token_uri)
      .to_return(status: 200, body: response_body, headers: {'Content-Type' => 'application/json'})

    authenticator = Worldline::Acquiring::SDK::Authentication::OAuth2Authenticator.new($configuration)
    request_uri = URI::HTTP.build(path: '/operations')

    runner_threads = Array.new(10){ Thread.new{
        authenticator.get_authorization(nil, request_uri, nil)
    }}
    runner_threads.each { |t| expect(t.value).to eq('Bearer accessToken') }

    assert_requested :post, $configuration.oauth2_token_uri, times: 1
  end

  it 'should fail with an invalid-client response' do
    response_body = IO.read(resource_prefix + 'oauth2AccessToken.invalidClient.json')

    stub_request(:post, $configuration.oauth2_token_uri)
      .to_return(status: 401, body: response_body, headers: {'Content-Type' => 'application/json'})

    authenticator = Worldline::Acquiring::SDK::Authentication::OAuth2Authenticator.new($configuration)
    request_uri = URI::HTTP.build(path: '/operations')

    runner_threads = Array.new(10){ Thread.new{
      authenticator.get_authorization(nil, request_uri, nil)
    }}
    runner_threads.each { |t| expect{t.value}.to raise_error(OAuth2Exception) { |error|
      expect(error.message).to eq('There was an error while retrieving the OAuth2 access token: unauthorized_client - INVALID_CREDENTIALS: Invalid client credentials');
    }}

    assert_requested :post, $configuration.oauth2_token_uri, times: runner_threads.length
  end

  it 'should retrieve the access token every time it is expired' do
    response_body = IO.read(resource_prefix + 'oauth2AccessToken.expired.json')

    stub_request(:post, $configuration.oauth2_token_uri)
      .to_return(status: 200, body: response_body, headers: {'Content-Type' => 'application/json'})

    authenticator = Worldline::Acquiring::SDK::Authentication::OAuth2Authenticator.new($configuration)
    request_uri = URI::HTTP.build(path: '/operations')

    runner_threads = Array.new(10){ Thread.new{
      authenticator.get_authorization(nil, request_uri, nil)
    }}
    runner_threads.each { |t| expect(t.value).to eq('Bearer expiredAccessToken') }

    assert_requested :post, $configuration.oauth2_token_uri, times: runner_threads.length
  end
end
