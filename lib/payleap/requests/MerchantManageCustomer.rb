require 'rubygems'
require 'httparty'
#This service operation allows you to add, update, and delete customer information.
class MerchantManageCustomer
#This method returns string response 
#url - Base url of service
#Username - Your PayLeap API login ID.
#Password - Your PayLeap API transaction key.
#TransType - The transaction type being performed. Valid values are:
#Add
#Update
#Delete
#Vendor - Your PayLeap Vendor number that uniquely identifies your merchant account.
#CustomerKey - Unique numerical identifier for a customer. Found in the response values for ManageCustomer, AddRecurringCreditCard, and AddRecurringCheck.
#CustomerID - Unique, merchant-supplied identifier for a customer.
#FirstName - Customer’s first name.
#LastName - Customer’s last name.
#Title - Customer’s title.
#Department - Customer’s department.
#Street1 - Line 1 of customer’s street address.
#Street2 - Line 2 of customer’s street address.
#Street3 - Line 3 of customer’s street address.
#City - Customer’s city.
#StateID - Customer’s 2-digit state code.
#Province - Customer’s province if outside the USA.
#Zip - Customer’s ZIP or postal code.
#CountryID - Customer’s 3-digit country code. For example: USA, CAN.
#DayPhone - Customer’s daytime number in ###-###-#### format.
#NightPhone - Customer’s nighttime number in ###-###-#### format.
#Fax - Customer’s fax number in ###-###-#### format.
#Mobile - Customer’s mobile number in ###-###-#### format.
#Email - Customer’s billing email address.
#ExtData - Not used for this operation.
   def ManageCustomer(url,userName,password,transType,vendor,customerKey,customerID,customerName,firstName,lastName, 
title,department,street1,street2,street3,city,stateID,province,zip,countryID,dayPhone,nightPhone,fax,email,mobile,status,extData)
  
  data = 'Username='+userName+'&Password='+password+'&TransType='+transType+'&Vendor='+vendor+'&CustomerKey='+customerKey+'&CustomerID='+customerID+'&CustomerName='+customerName+'&FirstName='+firstName+'&LastName='+lastName+'&Title='+title+'&Department='+department+'&Street1='+street1+'&Street2='+street2+'&Street3='+street3+'&City='+city+'&StateID='+stateID+'&Province='+province+'&Zip='+zip+'&CountryID='+countryID+'&DayPhone='+dayPhone+'&NightPhone='+nightPhone+'&Fax='+fax+'&Email='+email+'&Mobile='+mobile+'&Status='+status+'&ExtData='+extData
  
    strresponse = ""
	begin
    response = HTTParty.get(URI.encode(url+'?'+data))
    data = response.parsed_response
	result = String.new(data['RecurringResult']['Code'].to_s)
  if(result == "Ok")
    strresponse = strresponse + data['RecurringResult']['Error'].to_s + '. Your CustomerKey=' + data['RecurringResult']['CustomerKey'].to_s
   else                 
     strresponse = strresponse + data['RecurringResult']['Error'].to_s
     end 
	return strresponse
	rescue Exception => e
        return e.message
      end	
	end
end