#This method checks the expiration date of card.
class TransactValidExpDate
#This method returns string response
#url - base url of service
#ExpDate - The expiration date to verify in MMYY format.
  def ValidExpDate(url,expdate)
    data = 'ExpDate='+expdate
	strresponse = ""
	begin
    response = HTTParty.get(URI.encode(url+'?'+data))
    data = response.parsed_response
	
	if(data["boolean"]["__content__"] == 'true')
	  strresponse = strresponse + "Valid expiration date."
	end
	if(data["boolean"]["__content__"] == 'false')
	  strresponse = strresponse + "Invalid expiration date."
	 end 
	return strresponse
	rescue Exception => e
        return e.message
     end
  end
end
 
