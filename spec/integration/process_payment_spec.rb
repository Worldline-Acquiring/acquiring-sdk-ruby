require 'spec_helper'
require 'yaml'
require 'integration_setup'
require 'webmock/rspec'
require 'worldline/acquiring/sdk/v1/acquirer/merchant/payments/get_payment_status_params'

describe 'process payment' do

  before(:context){WebMock.allow_net_connect!}
  after(:context){WebMock.disable_net_connect!}

  it 'can be accessed' do
    Integration.init_client(false) do |client|
      payments_client = client.v1.acquirer(Integration::ACQUIRER_ID).merchant(Integration::MERCHANT_ID).payments

      request = Integration.get_api_payment_request
      response = payments_client.process_payment(request)

      expect(response.operation_id).to eq(request.operation_id)
      expect(response.response_code).to eq('0')
      expect(response.response_code_category).to eq('APPROVED')
      expect(response.response_code_description).to_not be_nil
      expect(response.status).to eq('AUTHORIZED')
      expect(response.initial_authorization_code).to_not be_nil
      expect(response.payment_id).to_not be_nil
      expect(response.total_authorized_amount).to_not be_nil
      expect(response.total_authorized_amount.amount).to eq(200)
      expect(response.total_authorized_amount.currency_code).to eq('GBP')
      expect(response.total_authorized_amount.number_of_decimals).to eq(2)

      payment_id = response.payment_id

      query = Worldline::Acquiring::SDK::V1::Acquirer::Merchant::Payments::GetPaymentStatusParams.new
      query.return_operations = true

      status = payments_client.get_payment_status(payment_id, query)

      expect(status.initial_authorization_code).to_not be_nil
      expect(status.payment_id).to eq(payment_id)
      expect(status.status).to eq('AUTHORIZED')
    end
  end
end
