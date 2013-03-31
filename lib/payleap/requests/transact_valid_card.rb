#The ValidCard service operation performs a validation check on a credit card.
class TransactValidCard
#This method returns string response
#url - base url of service 
#CardNum - The credit card number to verify.
#ExpDate - The expiration date of the credit card to verify in MMYY format.
  def ValidCard(url,cardnumber,expdate)
   data = 'CardNumber='+cardnumber+'&ExpDate='+expdate
   strresponse = ""
    begin
    response = HTTParty.get(URI.encode(url+'?'+data))
	data = response.parsed_response
	if(data["int"]["__content__"] == '0')
	   strresponse = strresponse + 'Valid card and expiration date.'
     end	  
    if(data["int"]["__content__"] == '1001')
	  strresponse = strresponse + "No card number present."
	end
	if(data["int"]["__content__"] == '1002')
	  strresponse = strresponse + "No expiration date present."
	end
	if(data["int"]["__content__"] == '1003')
	  strresponse = strresponse + "Invalid card type."
	end
	if(data["int"]["__content__"] == '1004')
	  strresponse = strresponse + "Invalid card length."
	end
	if(data["int"]["__content__"] == '1005')
	  strresponse = strresponse + "Invalid mod 10 check."
	end
	if(data["int"]["__content__"] == '1006')
	  strresponse = strresponse + "Invalid expiration date."
	end
    return strresponse
	rescue Exception => e
        return e.message
     end
  end 
end
