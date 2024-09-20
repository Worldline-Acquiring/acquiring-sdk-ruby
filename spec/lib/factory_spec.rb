require 'spec_helper'
require 'uri'

Factory ||= Worldline::Acquiring::SDK::Factory

describe 'Factory' do
  it 'can initialize configurations' do
    configuration = Factory.create_configuration(PROPERTIES_URI_OAUTH2, OAUTH2_CLIENT_ID, OAUTH2_CLIENT_SECRET)

    expect(configuration.api_endpoint).to eq('https://api.preprod.acquiring.worldline-solutions.com')
    expect(configuration.authorization_type).to eq('OAuth2')
    expect(configuration.connect_timeout).to eq(1000)
    expect(configuration.socket_timeout).to eq(1000)
    expect(configuration.max_connections).to eq(100)
    expect(configuration.oauth2_client_id).to eq(OAUTH2_CLIENT_ID)
    expect(configuration.oauth2_client_secret).to eq(OAUTH2_CLIENT_SECRET)
    expect(configuration.proxy_configuration).to be_nil
  end

  it 'can initialize communicators' do
    communicator = Factory.create_communicator_from_file(PROPERTIES_URI_OAUTH2, OAUTH2_CLIENT_ID, OAUTH2_CLIENT_SECRET)
    connection = communicator.instance_variable_get(:@connection)
    authenticator = communicator.instance_variable_get(:@authenticator)
    metadata_provider = communicator.instance_variable_get(:@metadata_provider)
    request_headers = metadata_provider.metadata_headers

    expect(communicator.marshaller).to be(Worldline::Acquiring::SDK::JSON::DefaultMarshaller.instance)
    expect(connection).to be_an_instance_of(Worldline::Acquiring::SDK::Communication::DefaultConnection)
    expect(authenticator).to be_an_instance_of(Worldline::Acquiring::SDK::Authentication::OAuth2Authenticator)
    expect(metadata_provider).to be_an_instance_of(Worldline::Acquiring::SDK::Communication::MetadataProvider)

    expect(authenticator.instance_variable_get(:@client_id)).to eq(OAUTH2_CLIENT_ID)
    expect(authenticator.instance_variable_get(:@client_secret)).to eq(OAUTH2_CLIENT_SECRET)

    expect(request_headers.length).to eq(1)
    expect(request_headers[0].name).to eq('X-WL-ServerMetaInfo')
  end
end
