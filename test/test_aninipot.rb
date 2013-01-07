require_relative 'test_helper'
require_relative '../lib/aninipot'

describe Aninipot do

  before do
    @client = initialize_rest_client
  end

  def initialize_rest_client
    Aninipot::Client.configure do |config|
      config.api = config_file['api']
      config.from = config_file['from']
    end
  end

  it 'should be able to send sms' do
    begin
      response = @client.send_sms("+639275866897", "Test Data")
    rescue Exception => e
      e.message.must_equal Aninipot::Response.new(200).to_s
    end
  end
end