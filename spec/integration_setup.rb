require 'spec_helper'
require 'date'
require 'securerandom'
require 'yaml'
require 'worldline/acquiring/sdk/v1/acquirer'
require 'worldline/acquiring/sdk/v1/domain'

module Integration
  ACQUIRER_ID = ENV['acquiring_api_acquirerId']
  MERCHANT_ID = ENV['acquiring_api_merchantId']
  OAUTH2_CLIENT_ID = ENV['acquiring_api_oauth2_clientId']
  OAUTH2_CLIENT_SECRET = ENV['acquiring_api_oauth2_clientSecret']
  OAUTH2_TOKEN_URI = ENV['acquiring_api_oauth2_tokenUri']
  raise 'could not access environment variable acquiring_api_acquirerId required for testing' unless ACQUIRER_ID
  raise 'could not access environment variable acquiring_api_merchantId required for testing' unless MERCHANT_ID
  raise 'could not access environment variable acquiring_api_oauth2_clientId required for testing' unless OAUTH2_CLIENT_ID
  raise 'could not access environment variable acquiring_api_oauth2_clientSecret required for testing' unless OAUTH2_CLIENT_SECRET
  raise 'could not access environment variable acquiring_api_oauth2_tokenUri required for testing' unless OAUTH2_TOKEN_URI
  PROPERTIES_URI_OAUTH2 = File.absolute_path(File.join(__FILE__, '../fixtures/resources/properties.oauth2.yml'))
  PROPERTIES_URI_PROXY = File.absolute_path(File.join(__FILE__, '../fixtures/resources/properties.proxy.yml'))

  def self.create_uri(scheme, host, port)
    if port == -1
      "#{scheme}://#{host}"
    else
      "#{scheme}://#{host}:#{port.to_s}"
    end
  end

  def self.init_communicator_configuration(properties_url: PROPERTIES_URI_OAUTH2, max_connections: nil)
    yaml = YAML.load_file(properties_url)
    configuration = Worldline::Acquiring::SDK::CommunicatorConfiguration.new(properties: yaml,
                                                                             api_endpoint: 'https://api.preprod.acquiring.worldline-solutions.com',
                                                                             authorization_type: 'OAuth2',
                                                                             oauth2_client_id: OAUTH2_CLIENT_ID,
                                                                             oauth2_client_secret: OAUTH2_CLIENT_SECRET,
                                                                             oauth2_token_uri: OAUTH2_TOKEN_URI,
                                                                             max_connections: max_connections)
    host = ENV['acquiring_api_endpoint_host']
    if host
      scheme = ENV.fetch('acquiring_api_endpoint_scheme', 'https')
      port = ENV.fetch('acquiring_api_endpoint_port', -1)
      configuration.api_endpoint = create_uri(scheme, host, port)
    end
    configuration
  end

  def self.init_client(with_proxy, max_connections = nil)
    if with_proxy
      url = PROPERTIES_URI_PROXY
    else
      url = PROPERTIES_URI_OAUTH2
    end
    configuration = init_communicator_configuration(properties_url: url, max_connections: max_connections)
    yield client = Worldline::Acquiring::SDK::Factory.create_client_from_configuration(configuration)
    client.close
  end

  def self.get_api_payment_request
    request = Worldline::Acquiring::SDK::V1::Domain::ApiPaymentRequest.new

    request.amount = Worldline::Acquiring::SDK::V1::Domain::AmountData.new
    request.amount.amount = 200
    request.amount.currency_code = 'GBP'
    request.amount.number_of_decimals = 2
    request.authorization_type = 'PRE_AUTHORIZATION'
    request.transaction_timestamp = DateTime.now
    request.card_payment_data = Worldline::Acquiring::SDK::V1::Domain::CardPaymentData.new
    request.card_payment_data.card_entry_mode = 'ECOMMERCE'
    request.card_payment_data.allow_partial_approval = false
    request.card_payment_data.brand = 'VISA'
    request.card_payment_data.capture_immediately = false
    request.card_payment_data.cardholder_verification_method = 'CARD_SECURITY_CODE'
    request.card_payment_data.card_data = Worldline::Acquiring::SDK::V1::Domain::PlainCardData.new
    request.card_payment_data.card_data.expiry_date = '122031'
    request.card_payment_data.card_data.card_number = '4176669999000104'
    request.card_payment_data.card_data.card_security_code = '012'
    request.references = Worldline::Acquiring::SDK::V1::Domain::PaymentReferences.new
    request.references.merchant_reference = 'your-order-' + SecureRandom.uuid
    request.operation_id = SecureRandom.uuid
    request
  end

  def self.get_dcc_rate_request(amount = 200)
    amount_data = Worldline::Acquiring::SDK::V1::Domain::AmountData.new
    amount_data.amount = amount
    amount_data.currency_code = 'GBP'
    amount_data.number_of_decimals = 2

    transaction_data_for_dcc = Worldline::Acquiring::SDK::V1::Domain::TransactionDataForDcc.new
    transaction_data_for_dcc.amount = amount_data
    transaction_data_for_dcc.transaction_type = 'PAYMENT'
    transaction_data_for_dcc.transaction_timestamp = DateTime.now

    point_of_sale_data_for_dcc = Worldline::Acquiring::SDK::V1::Domain::PointOfSaleDataForDcc.new
    point_of_sale_data_for_dcc.terminal_id = '12345678'

    card_data_for_dcc = Worldline::Acquiring::SDK::V1::Domain::CardDataForDcc.new
    card_data_for_dcc.bin = '41766699'
    card_data_for_dcc.brand = 'VISA'

    request = Worldline::Acquiring::SDK::V1::Domain::GetDCCRateRequest.new
    request.operation_id = SecureRandom.uuid
    request.target_currency = 'EUR'
    request.card_payment_data = card_data_for_dcc
    request.point_of_sale_data = point_of_sale_data_for_dcc
    request.transaction = transaction_data_for_dcc

    request
  end
end
