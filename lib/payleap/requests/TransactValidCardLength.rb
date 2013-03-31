#It checks the card length based on the card type
class TransactValidCardLength
#This method resturns string response
#url - Base url of service
#CardNum - The credit card number to verify.
 def ValidCardLength(url,cardnumber)
  data = 'CardNumber='+cardnumber
    strresponse = ""
	begin
    response = HTTParty.get(URI.encode(url+'?'+data))
    data = response.parsed_response
	
	if(data["boolean"]["__content__"] == 'true')
	  strresponse = strresponse + "Valid card length."
	 end 
   if(data["boolean"]["__content__"] == 'false')
	  strresponse = strresponse + "Invalid card length."
	end 
   return strresponse
  rescue Exception => e
        return e.message
     end   
   end
end
