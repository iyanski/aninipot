require 'yaml'
require 'minitest/pride'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/matchers'

def config_file
  config ||= YAML::load(File.open((File.join(File.dirname(__FILE__), 'config.yml'))))
end