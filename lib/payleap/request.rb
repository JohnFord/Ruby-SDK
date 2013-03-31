module Payleap
  module Request
    def payleap_get(options)
      credentials = { :Username => username, :Password => transaction_key }
      params = encode_params(options[:params].merge(credentials))
      begin
        url = URI.encode("#{Payleap::UAT_SERVER_URL}/#{options[:call]}?#{params}")
        HTTParty.get(url).parsed_response
      rescue Exception => e
        # TODO: Throw Payleap Exception
        throw e
      end
    end

    def encode_params(params={})
      params.collect{|k,v| "#{k}=#{v}"}.join('&')
    end
  end
end
