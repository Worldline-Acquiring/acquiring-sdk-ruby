require 'spec_helper'

describe 'Client' do
  Factory ||= Worldline::Acquiring::SDK::Factory
  Connection ||= Worldline::Acquiring::SDK::Communication::Connection
  PooledConnection ||= Worldline::Acquiring::SDK::Communication::PooledConnection

  it 'should not close idle connections of an unpooled connection' do
    conn = Connection.allocate  # Create fake (uninitialized) connection
    communicator = Factory.create_communicator_from_file(PROPERTIES_URI_OAUTH2, OAUTH2_CLIENT_ID, OAUTH2_CLIENT_SECRET, connection: conn)
    client = Factory.create_client_from_communicator(communicator)

    expect(communicator.instance_variable_get(:@connection)).to_not receive(:close_idle_connections)

    client.close_idle_connections(0.500)
  end

  it 'should close idle connections of a pooled connection' do
    conn = PooledConnection.allocate  # Create fake (uninitialized) connection
    communicator = Factory.create_communicator_from_file(PROPERTIES_URI_OAUTH2, OAUTH2_CLIENT_ID, OAUTH2_CLIENT_SECRET, connection: conn)
    client = Factory.create_client_from_communicator(communicator)

    expect(communicator.instance_variable_get(:@connection)).to receive(:close_idle_connections).with(0.500)

    client.close_idle_connections(0.500)
  end

  it 'should not close expired connections of an unpooled connection' do
    conn = Connection.allocate  # Create fake (uninitialized) connection
    communicator = Factory.create_communicator_from_file(PROPERTIES_URI_OAUTH2, OAUTH2_CLIENT_ID, OAUTH2_CLIENT_SECRET, connection: conn)
    client = Factory.create_client_from_communicator(communicator)

    expect(communicator.instance_variable_get(:@connection)).to_not receive(:close_expired_connections)

    client.close_expired_connections
  end

  it 'should close expired connections of a pooled connection' do
    conn = PooledConnection.allocate  # Create fake (uninitialized) connection
    communicator = Factory.create_communicator_from_file(PROPERTIES_URI_OAUTH2, OAUTH2_CLIENT_ID, OAUTH2_CLIENT_SECRET, connection: conn)
    client = Factory.create_client_from_communicator(communicator)

    expect(communicator.instance_variable_get(:@connection)).to receive(:close_expired_connections)

    client.close_expired_connections
  end
end
