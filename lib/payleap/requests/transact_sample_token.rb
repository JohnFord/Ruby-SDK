#This class generates Customer Key
class TransactSampleToken
#this method returns string response
#url - base url of service
#UserName - Your PayLeap API login ID.
#Password - Your PayLeap API transaction key.
#TransType - The transaction type being performed. Always:
#FoodStampSale
#CardNum - The EBT card number used for the transaction.
#ExpDate - The expiration date of the EBT card used for the transaction in MMYY format.
#MagData - The complete raw magnetic stripe data from the card wrapped in single quotes. For example:
#MagData='%B4111111111111111^BO/JAMES B^14041010000000593000000?; 4111111111111111=14041010000059300000?'
#NameOnCard - The cardholder’s name as printed on the card.
#Amount - The dollar amount of the transaction in DDDDDDDDDD.CC format. This amount includes any surcharge.
#InvNum - The invoice number used by the merchant to identify the transaction.
#PNRef - Not used for this transaction type.
#zip - The cardholder’s billing ZIP code.
#Street - The cardholder’s street address.
#cvNum -  The 3-4 digit card verification number. For American Express, four digits displayed on the front of the card; for #other card types, usually three digits displayed on the back of the card.
#ExtData - An XML string containing additional data for the transaction. 
def SampleToken(url,userName,password,transType,cardNum,vendorNum,expDate,magData,nameOnCard,amount,invNum,pNRef,zip,street,cVNum, extData)
   data = 'UserName=' + userName + '&Password=' + password +'&TransType=' + transType + '&CardNum=' + cardNum +'&ExpDate='+ expDate +'&MagData='+ magData +'&NameOnCard='+ nameOnCard +'&Amount='+ amount +'&InvNum='+ invNum +'&PNRef='+ pNRef +'&Zip='+ zip +'&Street='+ street +'&CVNum='+ cVNum +'&ExtData='+ extData
    strresponse = ""
	strCcInfokey = ""
	merchanturl = ""
	begin
	if(url.index("uat") > 0 )
	   merchanturl = Payleap::UAT_SERVER_URL + 'MerchantServices.svc/ProcessCreditCard'
	else
       merchanturl = Payleap::PRODUCTION_SERVER_URL + 'MerchantServices.svc/ProcessCreditCard'
	 end  
	response = HTTParty.get(URI.encode(url+'?'+data))
	data = response.parsed_response
	result = String.new(data['Response']['Result'])
	case result
    when '0'
       strCcInfokey += data['Response']['TokenNumber']
	else
	  strresponse = 'Bad'+","
      strresponse = strresponse + 'Error Number:  '+data['Response']['Result'].to_s+","
      strresponse = strresponse + 'Result: '+data['Response']['RespMSG'].to_s+","
      strresponse = strresponse + 'Status:  '+data['Response']['Message'].to_s+"."
	end
     if(!strCcInfokey.empty?)
       data = 'Username='+userName+'&Password='+password+'&Vendor='+vendorNum+'&CcInfoKey='+strCcInfokey+'&Amount='+amount+'&InvNum='+invNum+'&ExtData='+extData
    strresponse = ""
	response = HTTParty.get(URI.encode(merchanturl+'?'+data))
    data = response.parsed_response
    result = String.new(data['RecurringResult']['Message'].to_s)
    if(result == "APPROVAL")
	    strresponse = strresponse + "TokenNumber = " + strCcInfokey
    else 
       	strresponse = strresponse + data['RecurringResult']['Error'] 
      end
     end
     return strresponse
	 rescue Exception => e
        return e.message
     end
    end 
end


