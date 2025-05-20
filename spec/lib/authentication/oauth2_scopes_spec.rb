require 'spec_helper'

describe 'OAuth2Scopes' do

  it 'all should contain the correct scopes' do
    all_scopes = Worldline::Acquiring::SDK::Authentication::OAuth2Scopes.all
    expect(all_scopes).to include('processing_payment')
    expect(all_scopes).to include('processing_dcc_rate')
    expect(all_scopes).to include('services_ping')

    all_scopes_string = all_scopes.join(' ')
    expect(all_scopes_string.length).to be <= 260
  end

  it 'for v1 should contain the correct scopes' do
    scopes = Worldline::Acquiring::SDK::Authentication::OAuth2Scopes.for_api_version('v1')
    expect(scopes).to include('processing_payment')
    expect(scopes).to include('processing_dcc_rate')
    expect(scopes).to include('services_ping')
  end

  it 'for an unknown API version should contain no scopes' do
    scopes = Worldline::Acquiring::SDK::Authentication::OAuth2Scopes.for_api_version('v-1')
    expect(scopes).to eq([])
  end

  it 'for v1 processPayment should contain the correct scopes' do
    scopes = Worldline::Acquiring::SDK::Authentication::OAuth2Scopes.for_operation('v1', 'processPayment')
    expect(scopes).to include('processing_payment')
  end

  it 'for v1 requestDccRate should contain the correct scopes' do
    scopes = Worldline::Acquiring::SDK::Authentication::OAuth2Scopes.for_operation('v1', 'requestDccRate')
    expect(scopes).to include('processing_dcc_rate')
  end

  it 'for an unknown operation should contain no scopes' do
    scopes = Worldline::Acquiring::SDK::Authentication::OAuth2Scopes.for_operation('v1', 'unknown')
    expect(scopes).to eq([])
  end

  it 'for an unknown API version should contain no scopes' do
    scopes = Worldline::Acquiring::SDK::Authentication::OAuth2Scopes.for_operation('v-1', 'processPayment')
    expect(scopes).to eq([])
  end

  it 'for multiple v1 operations should contain the correct scopes' do
    scopes = Worldline::Acquiring::SDK::Authentication::OAuth2Scopes.for_operations('v1', 'processPayment', 'requestDccRate', 'unknown')
    expect(scopes).to include('processing_payment')
    expect(scopes).to include('processing_dcc_rate')
    expect(scopes).not_to include('services_ping')
  end

  it 'for multiple operations of an unknown API version should contain no scopes' do
    scopes = Worldline::Acquiring::SDK::Authentication::OAuth2Scopes.for_operations('v-1', 'processPayment', 'requestDccRate')
    expect(scopes).to eq([])
  end

  it 'for filtered operations should contain the correct scopes' do
    operation_ids = [ 'processPayment', 'requestDccRate', 'unknown' ]
    scopes = Worldline::Acquiring::SDK::Authentication::OAuth2Scopes.for_filtered_operations(lambda { |api_version, operation_id| api_version == 'v1' && operation_ids.include?(operation_id) })
    expect(scopes).to include('processing_payment')
    expect(scopes).to include('processing_dcc_rate')
    expect(scopes).not_to include('services_ping')
  end
end
