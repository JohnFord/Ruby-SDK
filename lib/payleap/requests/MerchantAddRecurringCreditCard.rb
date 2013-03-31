require 'rubygems'
require 'httparty'
#This class will help you to consume the service which allows you to add a customer, contract, and credit card payment #method all in one call
class MerchantAddRecurringCreditCard
#This method returns string response 
#url - Base Url of service
#Username - Your PayLeap API login ID.
#Password - Your PayLeap API transaction key.
#Vendor - Your PayLeap Vendor number that uniquely identifies your merchant account.
#CustomerID - Unique, merchant-supplied identifier for a customer.
#CustomerName - Name used to refer to customer in SCM API.
#FirstName - Customer’s first name.
#LastName - Customer’s last name.
#Title - Customer’s title.
#Department - Customer’s department.
#Street1 - Line 1 of customer’s street address.
#Street2 - Line 2 of customer’s street address.
#Street3- Line 3 of customer’s street address.
#City - Customer’s city.
#StateID - Customer’s 2-digit state code.
#Province - Customer’s province if outside the USA.
#Zip - Customer’s ZIP or postal code.
#CountryID - Customer’s 3-digit country code. For example: USA, CAN.
#Email - Customer’s billing email address.
#Mobile - Customer’s phone number in ###-###-#### format.
#ContractID - Unique, merchant-supplied identifier for the contract.
#ContractName - Merchant-supplied contract name.
#BillAmt - The amount to be billed in relation to the contract in DDDDDDDDDD.CC format.
#TaxAmt - The tax amount in DDDD.CC format.
#TotalAmt - The total amount of the transaction in DDDDDDDDDD.CC format. This includes any tax specified in TaxAmt.
#StartDate - Start date of the contract in MM/DD/YYYY format.
#EndDate - End date of the contract in MM/DD/YYYY format. If this date is not given, the contract will continue to run until #manually cancelled or suspended by the system due to failure of payment.
#BillingPeriod - Used in conjunction with BillingInterval to compute next bill date. Valid values are:
#Day or Daily
#Week or Weekly
#Biweekly
#Month or Monthly
#Semimonth or Semimonthly
#Year or Annually
#Semiannually
#Quarterly
#BillingInterval - Indicates the day on which the billing interval will be applied.
#For a BillingPeriod of Week/Weekly or Biweekly, valid values are:
#Mon or 1
#Tue or 2
#Wed or 3
#Thu or 4
#Fri or 5
#Sat or 6
#Sun or 7
#For a BillingPeriod of Month/Monthly, valid values are:
#1 – 31 (the date of the month)
#Last (the last day of each month)
#For a BillingPeriod of Day/Daily, Year/Annually, Semiannually, Semimonth/Semimonthly, or Quarterly, set this parameter to #0. The system will calculate the BillingInterval using the StartDate in the contract.
#MaxFailures - The maximum number of attempts to submit a payment before system puts contract into a suspended mode.
#FailureInterval - The number of days system will wait between each reattempt at processing payment.
#EmailCustomer - Indicates whether to email the customer regarding the status of recurring payment. Valid values are: True #or False.
#EmailMerchant - Indicates whether to email the merchant regarding the status of recurring payment. Valid values are: True or False.
#EmailCustomerFailure - Indicates whether to email the customer if recurring payment fails. Valid values are: True or False.
#EmailMerchantFailure - Indicates whether to email the merchant if recurring payment fails. Valid values are: True or False.
#CcAccountNum - Credit card number used for the transaction.
#CcExpdate - Expiration date of the credit card used for the transaction in MMYY format.
#CcNameOnCard - Cardholder’s name as printed on the card.
#CcStreet - Cardholder’s street Address. Used for AVS.
#CcZip - Cardholder’s billing ZIP or postal code. Used for AVS.
#ExtData - Not used for this operation.
  def AddRecurringCreditCard(url,username,password,vendor,customerid,customername,firstname,lastname,title,department,street1,street2,street3,city,stateid,province,zip,countryid,email,mobile,contractid,contractname,billamt,taxamt,totalamt,startdate,enddate,billingperiod,billinginterval,maxfailures,failureinterval,emailcustomer,emailmerchant,emailcustomerfailure,emailmerchantfailure,ccaccountnum,ccexpdate,ccnameoncard,ccStreet,cczip,extdata)
   
   data = 'Username='+username+'&Password='+password+'&Vendor='+vendor+'&CustomerID='+customerid+'&CustomerName='+customername+'&FirstName='+firstname+'&LastName='+lastname+'&Title='+title+'&Department='+department+'&Street1='+street1+'&Street2='+street2+'&Street3='+street3+'&City='+city+'&StateID='+stateid+'&Province='+province+'&Zip='+zip+'&CountryID='+countryid+'&Email='+email+'&Mobile='+mobile+'&ContractID='+contractid+'&ContractName='+contractname+'&BillAmt='+billamt+'&TaxAmt='+taxamt+'&TotalAmt='+totalamt+'&StartDate='+startdate+'&EndDate='+enddate+'&BillingPeriod='+billingperiod+'&BillingInterval='+billinginterval+'&MaxFailures='+maxfailures+'&FailureInterval='+failureinterval+'&EmailCustomer='+emailcustomer+'&EmailMerchant='+emailmerchant+'&EmailCustomerFailure='+emailcustomerfailure+'&EmailMerchantFailure='+emailmerchantfailure+'&CcAccountNum='+ccaccountnum+'&CcExpdate='+ccexpdate+'&CcNameOnCard='+ccnameoncard+'&CcStreet='+ccStreet+'&CcZip='+cczip+'&ExtData='+extdata
    strresponse = ""
	begin
    response = HTTParty.get(URI.encode(url+'?'+data))
    data = response.parsed_response
    result = String.new(data['RecurringResult']['Code'].to_s)
     if(result == "Ok")
	  strresponse =  strresponse + "Reccuring credit added successfully. your CustomerKey=" + data['RecurringResult']['CustomerKey'].to_s + ", your ContractKey=" + data['RecurringResult']['ContractKey'].to_s + " , your CcInfo key=" + data['RecurringResult']['CcInfoKey'].to_s
	 else
	   strresponse = strresponse + data['RecurringResult']['Error'].to_s
	 end
    return strresponse
   rescue Exception => e
        return e.message
    end		
  end 
end