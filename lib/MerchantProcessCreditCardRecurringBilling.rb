require 'rubygems'
require 'httparty'
#This class will help to call the service operation processes credit card transactions within the recurring billing module.
class MerchantProcessCreditCardRecurringBilling
#This method returns string response
#url - Base url of service
#Username - Your PayLeap API login ID.
#Password - Your PayLeap API transaction key.
#Vendor - Your PayLeap Vendor number that uniquely identifies your merchant account.
#CcInfoKey - Unique numerical identifier for credit card. Found in the response values for AddRecurringCreditCard and #ManageCreditCardInfo.
#Amount - The dollar amount of the transaction in DDDDDDDDDD.CC format.
#InvNum - The invoice number used by the merchant to identify the transaction.
#ExtData - Not used for this operation.
  def ProcessCreditCardRecurringBilling(url,userName,password,vendor,ccInfoKey,amount,invNum,extData)
    
	data = 'Username='+userName+'&Password='+password+'&Vendor='+vendor+'&CcInfoKey='+ccInfoKey+'&Amount='+amount+'&InvNum='+invNum+'&ExtData='+extData
    strresponse = ""
	begin
    response = HTTParty.get(URI.encode(url+'?'+data))
	data = response.parsed_response
    result = String.new(data['RecurringResult']['Message'].to_s)
    if(result == "APPROVAL")
            strresponse =  strresponse + ",credit card has been proccessed AuthCode=" + data['RecurringResult']['AuthCode'].to_s + ", PNRef=" + data['RecurringResult']['PNRef'].to_s
    else
      strresponse = strresponse + data['RecurringResult']['Error'].to_s
	 end 
    return strresponse
	rescue Exception => e
        return e.message
      end
    end
end
  