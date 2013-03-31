require 'rubygems'
require 'httparty'
#This service operation processes check transactions within the recurring billing module.
class MerchantProcessCheckRecurringBilling
#This method returns string response
#url - base url of service
#Username - Your PayLeap API login ID.
#Password - Your PayLeap API transaction key.
#Vendor - Your PayLeap Vendor number that uniquely identifies your merchant account.
#CheckInfoKey - Unique numerical identifier for check. Found in the response values for AddRecurringCheck and ManageCheckInfo.
#Amount - The dollar amount of the transaction in DDDDDDDDDD.CC format.
#InvNum - The invoice number used by the merchant to identify the transaction.
#ExtData - Not used for this operation.
  def ProcessCheckRecurringBilling(url,userName,password,vendor,checkInfoKey,amount,invNum,extData)
    data = 'Username='+userName+'&Password='+password+'&Vendor='+vendor+'&CheckInfoKey='+checkInfoKey+'&Amount='+amount+'&InvNum='+invNum+'&ExtData='+extData
    strresponse = ""
	begin
	response = HTTParty.get(URI.encode(url+'?'+data))
	data = response.parsed_response
    if(data['RecurringResult']['Message'].to_s == "APPROVAL")
        strresponse =  strresponse + "Credit card has been proccessed. AuthCode=" + data['RecurringResult']['AuthCode'].to_s + ",PNRef=" + data['RecurringResult']['PNRef'].to_s
     else                
	   strresponse = strresponse + data['RecurringResult']['Error'].to_s
     end           
	return strresponse
	rescue Exception => e
        return e.message
      end
   end
end  