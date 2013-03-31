module Payleap
  require 'httparty'
  %w( payleap/api
      payleap/constants
      payleap/version
  ).each do |lib|
    require File.join(File.dirname(__FILE__), lib)
  end
end
