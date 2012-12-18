module Aninipot
  module Configuration
    def self.included(base)
      base.extend ClassMethods
    end
  
    module ClassMethods
      def configure(&block)
        config = self.new
        raise ArgumentError, "Please provide configuration block" unless block_given?
        yield config
    
        [:api].each do |required|
          raise "#{required} is required" unless config.send(required)
        end
        config
      end
    end
  end
end