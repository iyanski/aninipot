module Aninipot
  class Response
    attr_reader :response_code
    #TODO:
    # Service Exception Extension	
    # Policy Exceptions	
    # Policy Exception Extension	    
    @@error_map = {
      :sent? => 200,
      :queued? => 201,
      :not_authorized? => 100,
      :not_enough_balance? => 101,
      :featured_not_allowed? => 102,
      :invalid_option? => 103,
      :gateway_down? => 104
    }
    
    @@status_messages = {
      200 => "Successfully Sent",
      201 => "Message Queued",
      100 => "Not Authorized",
      101 => "Not Enough Balance",
      102 => "Feature Not Allowed",
      103 => "Invalid Options",
      104 => "Gateway Down"
    }
    
    def initialize(code)
      @response_code = code
    end
    
    def valid?
      [200, 201].include?(self.response_code)
    end
    
    def to_s
      #"#{self.response_code} - #{msg}"
      msg
    end
    
    def msg(code = self.response_code)
      if msg = @@status_messages[code]
        msg
      else
        raise ArgumentError, "#{code} - undefined response code"
      end
    end
    
    def method_missing(method_id)
      if code = @@error_map[method_id.to_sym]
        self.response_code == code
      else
        raise NoMethodError
      end
    end
  end
end