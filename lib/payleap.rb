require 'httparty'
%w(api client configuration constants request version).each do |lib|
  require File.join(File.dirname(__FILE__), 'payleap', lib)
end
module Payleap
  extend Configuration

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
