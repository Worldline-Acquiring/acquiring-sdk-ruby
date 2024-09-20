require 'spec_helper'
require 'uri'

Communicator ||= Worldline::Acquiring::SDK::Communicator
Authenticator ||= Worldline::Acquiring::SDK::Authentication::Authenticator
DefaultMarshaller ||= Worldline::Acquiring::SDK::JSON::DefaultMarshaller
RequestParam ||= Worldline::Acquiring::SDK::Communication::RequestParam

describe Communicator do

  let(:conn){conn = Connection.allocate} # Create fake (uninitialized) connection
  let(:auth){auth = Authenticator.allocate} # Create fake (uninitialized) authenticator
  let(:metadataProvider){metadata_provider = MetadataProvider.new("Worldline")}
  let(:communicator){communicator = Communicator.new('https://api.preprod.acquiring.worldline-solutions.com', conn, auth, metadataProvider, DefaultMarshaller.instance)}
  context 'to_absolute_uri()' do
    it 'accepts a uri with or without a leading slash' do
      uri1 = communicator.send(:to_absolute_uri, 'services/v1/100812/520000214/dcc-rates', [])
      uri2 = communicator.send(:to_absolute_uri, '/services/v1/100812/520000214/dcc-rates', [])
      # Ruby URI library adds port in HTTPS url's by default
      expect(uri1.to_s).to eq('https://api.preprod.acquiring.worldline-solutions.com:443/services/v1/100812/520000214/dcc-rates')
      expect(uri2.to_s).to eq('https://api.preprod.acquiring.worldline-solutions.com:443/services/v1/100812/520000214/dcc-rates')
    end

    it 'adds request parameters to the uri' do
      request_params = [RequestParam.new('amount', '123'), RequestParam.new('source', 'USD'),
                        RequestParam.new('target', 'EUR'), RequestParam.new('dummy', 'é&%=')]

      uri = communicator.send(:to_absolute_uri, 'services/v1/100812/520000214/dcc-rates', request_params)

      expect(uri.to_s).to eq('https://api.preprod.acquiring.worldline-solutions.com:443/services/v1/100812/520000214/dcc-rates'\
                             '?amount=123&source=USD&target=EUR&dummy=%C3%A9%26%25%3D')
    end
  end
end
