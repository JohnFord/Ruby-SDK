module Payleap
  require 'httparty'
  %w( payleap/api
      payleap/client
      payleap/constants
      payleap/version
  ).each do |lib|
    require File.join(File.dirname(__FILE__), lib)
  end

  class << self
    def new(options={})
      Payleap::Client.new(options)
    end

    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end
  end
end
