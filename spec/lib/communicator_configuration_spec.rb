require 'spec_helper'
require 'yaml'

CommunicatorConfiguration ||= Worldline::Acquiring::SDK::CommunicatorConfiguration

describe 'CommunicatorConfiguration' do

  it 'can be constructed without a proxy' do
    yaml = '---
            acquiring.api.endpoint.host: api.preprod.acquiring.worldline-solutions.com
            acquiring.api.authorizationType: OAuth2
            acquiring.api.connectTimeout: 20
            acquiring.api.socketTimeout: 10'
    config = YAML.load(yaml)

    communicator_config = CommunicatorConfiguration.new(properties: config)

    expect(communicator_config.api_endpoint).to eq('https://api.preprod.acquiring.worldline-solutions.com')
    expect(communicator_config.authorization_type).to eq('OAuth2')
    expect(communicator_config.connect_timeout).to eq(20)
    expect(communicator_config.socket_timeout).to eq(10)

    expect(communicator_config.authorization_id).to be_nil
    expect(communicator_config.authorization_secret).to be_nil
    expect(communicator_config.proxy_configuration).to be_nil
    expect(communicator_config.integrator).to be_nil
    expect(communicator_config.shopping_cart_extension).to be_nil
  end

  it 'can be constructed with a proxy, without authentication' do
    yaml = '---
            acquiring.api.endpoint.host: api.preprod.acquiring.worldline-solutions.com
            acquiring.api.authorizationType: OAuth2
            acquiring.api.connectTimeout: 20
            acquiring.api.socketTimeout: 10
            acquiring.api.proxy.uri: http://proxy.example.org:3128'
    config = YAML.load(yaml)

    communicator_config = CommunicatorConfiguration.new(properties: config)
    proxy_config = communicator_config.proxy_configuration

    expect(communicator_config.api_endpoint).to eq('https://api.preprod.acquiring.worldline-solutions.com')
    expect(communicator_config.authorization_type).to eq('OAuth2')
    expect(communicator_config.connect_timeout).to eq(20)
    expect(communicator_config.socket_timeout).to eq(10)

    expect(communicator_config.authorization_id).to be_nil
    expect(communicator_config.authorization_secret).to be_nil
    expect(proxy_config).to be_truthy
    expect(proxy_config.scheme).to eq('http')
    expect(proxy_config.host).to eq('proxy.example.org')
    expect(proxy_config.port).to eq(3128)
    expect(proxy_config.username).to be_nil
    expect(proxy_config.password).to be_nil
  end

  it 'can be constructed to authenticate to a proxy' do
    yaml = '---
            acquiring.api.endpoint.host: api.preprod.acquiring.worldline-solutions.com
            acquiring.api.authorizationType: OAuth2
            acquiring.api.connectTimeout: 20
            acquiring.api.socketTimeout: 10
            acquiring.api.proxy.uri: http://proxy.example.org:3128
            acquiring.api.proxy.username: test-username
            acquiring.api.proxy.password: test-password'
    config = YAML.load(yaml)

    communicator_config = CommunicatorConfiguration.new(properties: config)
    proxy_config = communicator_config.proxy_configuration

    expect(communicator_config.api_endpoint).to eq('https://api.preprod.acquiring.worldline-solutions.com')
    expect(communicator_config.authorization_type).to eq('OAuth2')
    expect(communicator_config.connect_timeout).to eq(20)
    expect(communicator_config.socket_timeout).to eq(10)

    expect(communicator_config.authorization_id).to be_nil
    expect(communicator_config.authorization_secret).to be_nil
    expect(proxy_config).to be_truthy
    expect(proxy_config.scheme).to eq('http')
    expect(proxy_config.host).to eq('proxy.example.org')
    expect(proxy_config.port).to eq(3128)
    expect(proxy_config.username).to eq('test-username')
    expect(proxy_config.password).to eq('test-password')
  end

  it 'accepts a different number of maximum connections' do
    yaml = '---
            acquiring.api.endpoint.host: api.preprod.acquiring.worldline-solutions.com
            acquiring.api.authorizationType: OAuth2
            acquiring.api.connectTimeout: 20
            acquiring.api.socketTimeout: 10
            acquiring.api.maxConnections: 100'
    config = YAML.load(yaml)

    communicator_config = CommunicatorConfiguration.new(properties: config)

    expect(communicator_config.api_endpoint).to eq('https://api.preprod.acquiring.worldline-solutions.com')
    expect(communicator_config.authorization_type).to eq('OAuth2')
    expect(communicator_config.connect_timeout).to eq(20)
    expect(communicator_config.socket_timeout).to eq(10)
    expect(communicator_config.max_connections).to eq(100)

    expect(communicator_config.authorization_id).to be_nil
    expect(communicator_config.authorization_secret).to be_nil
    expect(communicator_config.proxy_configuration).to be_nil
  end

  it 'uses specific scheme to override default' do
    yaml = '---
            acquiring.api.endpoint.host: api.preprod.acquiring.worldline-solutions.com
            acquiring.api.authorizationType: OAuth2
            acquiring.api.connectTimeout: 20
            acquiring.api.socketTimeout: 10
            acquiring.api.endpoint.scheme: http'
    config = YAML.load(yaml)

    communicator_config = CommunicatorConfiguration.new(properties: config)

    expect(communicator_config.api_endpoint).to eq('http://api.preprod.acquiring.worldline-solutions.com')
  end

  it 'uses specific port to override default' do
    yaml = '---
            acquiring.api.endpoint.host: api.preprod.acquiring.worldline-solutions.com
            acquiring.api.authorizationType: OAuth2
            acquiring.api.connectTimeout: 20
            acquiring.api.socketTimeout: 10
            acquiring.api.endpoint.port: 8080'
    config = YAML.load(yaml)

    communicator_config = CommunicatorConfiguration.new(properties: config)

    expect(communicator_config.api_endpoint).to eq('https://api.preprod.acquiring.worldline-solutions.com:8080')
  end

  it 'uses specific scheme and port to override default' do
    yaml = '---
            acquiring.api.endpoint.host: api.preprod.acquiring.worldline-solutions.com
            acquiring.api.authorizationType: OAuth2
            acquiring.api.connectTimeout: 20
            acquiring.api.socketTimeout: 10
            acquiring.api.endpoint.scheme: http
            acquiring.api.endpoint.port: 8080'
    config = YAML.load(yaml)

    communicator_config = CommunicatorConfiguration.new(properties: config)

    expect(communicator_config.api_endpoint).to eq('http://api.preprod.acquiring.worldline-solutions.com:8080')
  end

  it 'stores shoppingCartExtension data' do
    yaml = '---
            acquiring.api.endpoint.host: api.preprod.acquiring.worldline-solutions.com
            acquiring.api.authorizationType: OAuth2
            acquiring.api.connectTimeout: 20
            acquiring.api.socketTimeout: 10
            acquiring.api.integrator: Worldline.Integrator
            acquiring.api.shoppingCartExtension.creator: Worldline.Creator
            acquiring.api.shoppingCartExtension.name: Worldline.ShoppingCarts
            acquiring.api.shoppingCartExtension.version: 1.0
            acquiring.api.shoppingCartExtension.extensionId: ExtensionId'
    config = YAML.load(yaml)

    communicator_config = CommunicatorConfiguration.new(properties: config)

    expect(communicator_config.api_endpoint).to eq('https://api.preprod.acquiring.worldline-solutions.com')
    expect(communicator_config.authorization_type).to eq('OAuth2')
    expect(communicator_config.connect_timeout).to eq(20)
    expect(communicator_config.socket_timeout).to eq(10)

    expect(communicator_config.authorization_id).to be_nil
    expect(communicator_config.authorization_secret).to be_nil
    expect(communicator_config.proxy_configuration).to be_nil
    expect(communicator_config.integrator).to eq('Worldline.Integrator')
    expect(communicator_config.shopping_cart_extension).to be_truthy
    expect(communicator_config.shopping_cart_extension.creator).to eq('Worldline.Creator')
    expect(communicator_config.shopping_cart_extension.name).to eq('Worldline.ShoppingCarts')
    expect(communicator_config.shopping_cart_extension.version).to eq('1.0')
    expect(communicator_config.shopping_cart_extension.extension_id).to eq('ExtensionId')
  end
end
