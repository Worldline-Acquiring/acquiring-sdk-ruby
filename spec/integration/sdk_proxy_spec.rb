require 'spec_helper'
require 'integration_setup'
require 'worldline/acquiring/sdk/factory'
require 'worldline/acquiring/sdk/communicator_configuration'
require 'worldline/acquiring/sdk/proxy_configuration'
require 'worldline/acquiring/sdk/communication/communication_exception'

require 'webrick'
require 'webrick/httpproxy'

describe 'proxies' do

  context 'using proxy server' do
    proxy_server = nil

    password_filename = 'password_file'

    before :context do
      WebMock.allow_net_connect!

      # set up a proxy
      proxy_server = Thread.new do
        config = { Realm: 'testing' }
        htpasswd = WEBrick::HTTPAuth::Htpasswd.new(password_filename) # create new Apache password file
        proxy_configuration = Integration.init_communicator_configuration(properties_url: Integration::PROPERTIES_URI_PROXY).proxy_configuration
        htpasswd.set_passwd config[:Realm], proxy_configuration.username, proxy_configuration.password
        config[:UserDB] = htpasswd
        basic_auth = WEBrick::HTTPAuth::ProxyBasicAuth.new(config)

        auth_handler = Proc.new do |req, res|
          basic_auth.authenticate(req, res)
        end

        proxy = WEBrick::HTTPProxyServer.new(Port: 9999, ProxyVia: false,
                                             ProxyAuthProc: auth_handler)
        Signal.trap('INT') do
            proxy.shutdown
        end

        proxy.start
      end

      sleep 1 # wait for the proxy server
    end

    after :context do
      Thread.kill(proxy_server)
      File.delete(password_filename)
      WebMock.disable_net_connect!
    end

    # NOTE: if this test is running for a long time with no response
    # check https://api.preprod.acquiring.worldline-solutions.com because this is where merchant
    # connects to.
    it 'can be connected to' do
      request = Integration.get_dcc_rate_request

      Integration.init_client(true) do |client|
        response = client.v1.acquirer(Integration::ACQUIRER_ID).merchant(Integration::MERCHANT_ID).dynamic_currency_conversion.request_dcc_rate(request)

        expect(response.proposal).to_not be_nil
        expect(response.proposal.original_amount).to_not be_nil
        expect(response.proposal.original_amount.amount).to eq(request.transaction.amount.amount)
        expect(response.proposal.original_amount.currency_code).to eq(request.transaction.amount.currency_code)
        expect(response.proposal.original_amount.number_of_decimals).to eq(request.transaction.amount.number_of_decimals)
        expect(response.proposal.resulting_amount.currency_code).to eq(request.target_currency)
      end
    end
  end # end of using proxy server
end
