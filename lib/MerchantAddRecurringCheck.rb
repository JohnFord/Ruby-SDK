require 'rubygems'
require 'httparty'
#This service operation allows you to add a customer, contract, and check payment method all in one call.
class MerchantAddRecurringCheck
#This method returns string response
#url - Base url of service
#Username - Your PayLeap API login ID.
#Password - Your PayLeap API transaction key.
#Vendor - Your PayLeap Vendor number that uniquely identifies your merchant account.
#CustomerID - Unique, merchant-supplied identifier for a customer.
#CustomerName - The name used to refer to customer in SCM API.
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
#Email - Customer’s billing email address.
#Mobile - Customer’s phone number in ###-###-#### format.
#ContractID  - Unique, merchant-supplied identifier for the contract.
#ContractName - Merchant-supplied contract name.
#BillAmt - The amount to be billed in relation to the contract in DDDDDDDDDD.CC format.
#TaxAmt - Tax amount in DDDD.CC format.
#TotalAmt - The total amount of the transaction in DDDDDDDDDD.CC format. This amount includes any tax specified in TaxAmt.
#StartDate - The start date of the contract in MM/DD/YYYY format.
#EndDate - The end date of the contract in MM/DD/YYYY format. If this date is not given, the contract will continue to run until manually cancelled or suspended by the system due to failure of payment.
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
#MaxFailures - The maximum number of attempts to submit a payment before system puts contract into a suspended mode
#FailureInterval - The number of days system will wait between each reattempt at processing payment.
#EmailCustomer - Indicates whether to email the customer regarding the status of recurring payment. Valid values are: True #or False.
#EmailMerchant - Indicates whether to email the merchant regarding the status of recurring payment. Valid values are: True #or False.
#EmailCustomerFailure - Indicates whether to email the customer if recurring payment fails. Valid values are: True or False.
#EmailMerchantFailure - Indicates whether to email the merchant if recurring payment fails. Valid values are: True or False.
#CheckType - Indicates check type. Valid values are:
#Personal
#Business
#AccountType - Indicates to which type of account the check points. Valid values are:
#Checking
#Savings
#CheckNum - The check number printed on the check.
#MICR - The scanned MICR data of the check.
#AccountNum - The account number printed on the check.
#TransitNum - The routing number printed on the check.
#SS - The customer’s Social Security Number in ###-###-#### format.
#DOB - The customer’s date of birth in MM/DD/YYYY format.
#BranchCity - The city in which the branch of the bank is located.
#DL - The customer’s date of birth in MM/DD/YYYY format.
#StateCode - The customer’s two-digit driver’s license state or province code.
#NameOnCheck - The customer’s name as printed on the check.
#ExtData - Not used for this operation.
  def AddRecurringCheck(url,userName,password,vendor,customerID,customerName,firstName,lastName,title,department,street1,street2,street3,city,stateID,province,zip,countryID,email,mobile,contractID,contractName,billAmt,taxAmt,
totalAmt,startDate,endDate,billingPeriod,billingInterval,maxFailures,failureInterval,emailCustomer,emailMerchant,
emailCustomerFailure,emailMerchantFailure,checkType,accountType,checkNum,mICR,accountNum,transitNum,sS,dOB,branchCity,dL,
stateCode,nameOnCheck,extData)
   
   data = 'Username='+userName+'&Password='+password+'&Vendor='+vendor+'&CustomerID='+customerID+'&CustomerName='+customerName+'&FirstName='+firstName+'&LastName='+lastName+'&Title='+title+'&Department='+department+'&Street1='+street1+'&Street2='+street2+'&Street3='+street3+'&City='+city+'&StateID='+stateID+'&Province='+province+'&Zip='+zip+'&CountryID='+countryID+'&Email='+email+'&Mobile='+mobile+'&ContractID='+contractID+'&ContractName='+contractName+'&BillAmt='+billAmt+'&TaxAmt='+taxAmt+'&TotalAmt='+totalAmt+'&StartDate='+startDate+'&EndDate='+endDate+'&BillingPeriod='+billingPeriod+'&BillingInterval='+billingInterval+'&MaxFailures='+maxFailures+'&FailureInterval='+failureInterval+'&EmailCustomer='+emailCustomer+'&EmailMerchant='+emailMerchant+'&EmailCustomerFailure='+emailCustomerFailure+'&EmailMerchantFailure='+emailMerchantFailure+'&CheckType='+checkType+'&AccountType='+accountType+'&CheckNum='+checkNum+'&MICR='+mICR+'&AccountNum='+accountNum+'&TransitNum='+transitNum+'&SS='+sS+'&DOB='+dOB+'&BranchCity='+branchCity+'&DL='+dL+'&StateCode='+stateCode+'&NameOnCheck='+nameOnCheck+'&ExtData='+extData
    begin
    strresponse = ""
    response = HTTParty.get(URI.encode(url+'?'+data))
	data = response.parsed_response
	response = ""
	 result = String.new(data['RecurringResult']['Code'].to_s)
    if (result == "Ok")
strresponse = strresponse + "Reccuring credit added successfully. your CustomerKey=" + data['RecurringResult']['CustomerKey'].to_s + ", your ContractKey=" + data['RecurringResult']['ContractKey'].to_s + "and your CheckInfo key=" + data['RecurringResult']['CheckInfoKey'].to_s 
     else
       strresponse = strresponse + data['RecurringResult']['Error'].to_s
	 end  
    return strresponse 
	rescue Exception => e
        return e.message
      end
  end
end
