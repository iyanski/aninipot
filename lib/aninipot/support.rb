module ClassSupportMixin
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def set_attributes(attrs)
      attr_accessor *attrs.keys
      define_method(:default_attributes) { attrs }
    end
  end
  
  module InstanceMethods
    def initialize(options={})
      init = if self.respond_to?(:default_attributes)
        self.default_attributes.merge(options)
      else
        options
      end
      init.each { |k, v| self.send("#{k}=", v) if self.respond_to?(k) }
    end
    
    def attributes
      attrs = {}
      self.default_attributes.keys.each {|k| attrs[k] = self.send(k) if self.respond_to?(k)}
      attrs
    end
  end
end