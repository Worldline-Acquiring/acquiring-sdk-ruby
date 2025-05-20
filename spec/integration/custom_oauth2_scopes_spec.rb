require 'spec_helper'
require 'yaml'
require 'integration_setup'
require 'webmock/rspec'

describe 'custom OAuth2 scopes' do

  before(:context){WebMock.allow_net_connect!}
  after(:context){WebMock.disable_net_connect!}

  ['processing_dcc_rate', 'processing_dcc_rate services_ping', '', nil].each do |oauth2_scopes|
    it "'#{oauth2_scopes || 'nil'}' are valid" do
      configuration = Integration.init_communicator_configuration
      configuration.oauth2_scopes = oauth2_scopes

      Factory.create_client_from_configuration(configuration) do |client|
        request = Integration.get_dcc_rate_request
        response = client.v1.acquirer(Integration::ACQUIRER_ID).merchant(Integration::MERCHANT_ID).dynamic_currency_conversion.request_dcc_rate(request)

        expect(response.proposal).to_not be_nil
        expect(response.proposal.original_amount).to_not be_nil
        expect(response.proposal.original_amount.amount).to eq(request.transaction.amount.amount)
        expect(response.proposal.original_amount.currency_code).to eq(request.transaction.amount.currency_code)
        expect(response.proposal.original_amount.number_of_decimals).to eq(request.transaction.amount.number_of_decimals)
        expect(response.proposal.resulting_amount.currency_code).to eq(request.target_currency)
      end
    end
  end

  it 'misses required scope' do
    configuration = Integration.init_communicator_configuration
    configuration.oauth2_scopes = 'services_ping'

    Factory.create_client_from_configuration(configuration) do |client|
      request = Integration.get_dcc_rate_request
      expect{client.v1.acquirer(Integration::ACQUIRER_ID).merchant(Integration::MERCHANT_ID).dynamic_currency_conversion.request_dcc_rate(request)}
        .to raise_error(Worldline::Acquiring::SDK::V1::AuthorizationException)
    end
  end

  it 'has an invalid scope' do
    configuration = Integration.init_communicator_configuration
    configuration.oauth2_scopes = 'processing_dcc_rate invalid_scope'

    Factory.create_client_from_configuration(configuration) do |client|
      request = Integration.get_dcc_rate_request
      expect {client.v1.acquirer(Integration::ACQUIRER_ID).merchant(Integration::MERCHANT_ID).dynamic_currency_conversion.request_dcc_rate(request)}
        .to raise_error(Worldline::Acquiring::SDK::Authentication::OAuth2Exception)
              .with_message(/There was an error while retrieving the OAuth2 access token: invalid_scope - .*/)
    end
  end
end
