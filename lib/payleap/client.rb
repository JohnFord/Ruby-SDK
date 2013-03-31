require File.join(File.dirname(__FILE__), 'configuration')
module Payleap
  class Client
    attr_accessor *Configuration::VALID_OPTIONS_KEYS
    def initialize(options={})
      options = Acculynk.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
  end
end
