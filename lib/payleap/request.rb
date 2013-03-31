module Payleap
  class Request
    def self.get(options)
      params = encode_params(options[:params])
      begin
        url = URI.encode("#{Payleap::UAT_SERVER_URL}?#{params}")
        HTTParty.get(url).parsed_response
      rescue Exception => e
        # TODO: Throw Payleap Exception
        throw e
      end
    end

    def self.encode_params(params={})
      params.collect{|k,v| "#{k}=#{v}"}.join('&')
    end
  end
end
