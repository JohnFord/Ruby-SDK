require 'rubygems'
require 'httparty'
#This service operation allows you to add allows you to add, update, and delete credit card payment information.
class MerchantManageCreditCardInfo
#This method resturns string response
#url - base url of service
#Username - Your PayLeap API login ID.
#Password - Your PayLeap API transaction key.
#TransType - The transaction type being performed. Valid values are:
#Add
#Update
#Delete
#Vendor - Your PayLeap Vendor number that uniquely identifies your merchant account.
#CustomerKey - Unique numerical identifier for a customer. Found in the response values of operations for managing customer #information and adding recurring payments.
#CardInfoKey - Unique numerical identifier for credit card. Found in the response values for AddRecurringCreditCard as the #CcInfoKey.
#CcAccountNum - Credit card number used for the transaction.
#CcExpDate - Expiration date of the credit card used for the transaction in MMYY format.
#CcNameonCard - Cardholder’s name as printed on the card.
#CcStreet - Cardholder’s street address. Used for AVS.
#CcZip - Cardholder’s billing ZIP or postal code. Used for AVS.
#ExtData - Not used for this operation.
  def ManageCreditCardInfo(url,userName,password,transType,vendor,customerKey,cardInfoKey,ccAccountNum,ccExpDate, ccNameonCard,ccStreet,ccZip,extData)
    
	data = 'Username='+userName+'&Password='+password+'&TransType='+transType+'&Vendor='+vendor+'&CustomerKey='+customerKey+'&CardInfoKey='+cardInfoKey+'&CcAccountNum='+ccAccountNum+'&CcExpDate='+ccExpDate+'&CcNameonCard='+ccNameonCard+'&CcStreet='+ccStreet+'&CcZip='+ccZip+'&ExtData='+extData
	
    strresponse = ""
	begin
    response = HTTParty.get(URI.encode(url+'?'+data))
    data = response.parsed_response
    if (data['RecurringResult']['Code'].to_s == "Ok")
        strresponse = strresponse + data['RecurringResult']['Error'].to_s + ".Your CustomerKey=" + data['RecurringResult']['CustomerKey'].to_s  + ", your CheckInfo key=" + data['RecurringResult']['CcInfoKey'].to_s
         else
            strresponse = strresponse + data['RecurringResult']['Error'].to_s
         end  
	  return strresponse
	 rescue Exception => e
        return e.message
     end 
  end
end