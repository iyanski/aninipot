module Aninipot
  class Client
    include ClassSupportMixin
    include Aninipot::Configuration
  
    set_attributes :host => 'www.semaphore.co',
      :port => '80',
      :api => '',
      :from => ''
    
    attr_reader :api, :from
    
    def send_sms(mobile, message)
      request = setup_connection(valid_sms_data(mobile, message))
      response = connect(request)
    end
    
    private
    
    def valid_sms_data(mobile, message)
      {"api" => self.api, "number" => mobile, "message" => message, "from" => self.from}
    end
    
    def setup_sms_outbound_endpoint
      "http://#{self.host}/api/sms"
    end
        
    def setup_connection(args)
      uri = URI.parse(setup_sms_outbound_endpoint)
      @http = Net::HTTP.new(uri.host, uri.port)      
      request = Net::HTTP::Post.new(uri.request_uri)
      request.set_form_data(args)
      request
    end
    
    def connect(request)
      response = @http.request(request)
      
      if response.body and !response.body.empty?
        object = JSON.parse(response.body)
      end
      if response.kind_of? Net::HTTPClientError
        error = Aninipot::Response.new object["code"]
        raise error.to_s
      end
      response
    end
  end
end