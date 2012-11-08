require 'rubygems'
require 'httparty'
#This method  performs a mod 10 checksum.
class TransactValidMod10
#This method resturns string response
#url - Base url of service 
#CardNum - The credit card number to verify.
   def ValidMod10(url,cardnumber)
    data = 'CardNumber='+cardnumber
    strresponse = ""
	begin
    response = HTTParty.get(URI.encode(url+'?'+data))
    data = response.parsed_response
	if(data["boolean"]["__content__"] == 'true')
	  strresponse = strresponse + "Valid card number."
	end
	if(data["boolean"]["__content__"] == 'false')
	  strresponse = strresponse + "Invalid card number."
	end 
	return strresponse
   rescue Exception => e
    return e.message
    end
   end
end


