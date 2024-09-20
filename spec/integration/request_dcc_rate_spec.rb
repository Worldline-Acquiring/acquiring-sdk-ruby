require 'spec_helper'
require 'yaml'
require 'integration_setup'
require 'webmock/rspec'

describe 'request DCC rate' do

  before(:context){WebMock.allow_net_connect!}
  after(:context){WebMock.disable_net_connect!}

  it 'can be accessed' do
    Integration.init_client(false) do |client|
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
