require 'rubygems'
require 'httparty'
#This service operation allows you to add, update, and delete contract information.
class MerchantManageContract
#This method returns string response
#url - baase url of service
#Username - Your PayLeap API login ID.
#Password - Your PayLeap API transaction key.
#TransType - The transaction type being performed. Valid values are:
#Add
#Update
#Delete
#Vendor - Your PayLeap Vendor number that uniquely identifies your merchant account.
#CustomerKey - Unique numerical identifier for a customer. Found in the response values for ManageCustomer, AddRecurringCreditCard, and AddRecurringCheck.
#ContractKey - Unique numerical identifier for the contract. Found in the response values for AddRecurringCheck and AddRecurringCreditCard.
#PaymentInfoKey - Dependent on payment type. For credit cards, use a CcInfoKey or CardInfoKey. For checks, use a CheckInfoKey.
#These keys can be found in the response values of AddRecurringCreditCard, ManageCreditCardInfo, AddRecurringCheck, and #ManageCheckInfo.
#PaymentType - Indicates method of payment. Valid values are:
#CC (for credit card)
#CK (for check)
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
#Email - Customer’s billing email address.
#DayPhone - Customer’s daytime number in ###-###-#### format.
#NightPhone - Customer’s nighttime number in ###-###-#### format.
#Fax - Customer’s fax number in ###-###-#### format.
#Mobile - Customer’s mobile number in ###-###-#### format.
#ContractID - Unique, merchant-supplied identifier for the contract.
#ContractName - Unique, merchant-supplied contract name.
#BillAmt - The amount to be billed in relation to the contract in DDDDDDDDDD.CC format.
#TaxAmt - The tax amount in DDDD.CC format.
#TotalAmt - The total amount of the transaction in DDDDDDDDDD.CC format. This includes any tax specified in TaxAmt.
#StartDate - Start date of the contract in MM/DD/YYYY format.
#EndDate - End date of the contract in MM/DD/YYYY format. If this date is not given, the contract will continue to run until #manually cancelled or suspended by the system due to failure of payment.
#NextBillDt  - Next billing date in MM/DD/YYYY format. For example: if the next billing date is scheduled to be 01/30/2015, #but NextBillDt=02/15/2015 when the request is submitted, the next billing date will change to 02/15/2015.
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
#EmailMerchantFailure - Indicates whether to email the merchant if recurring payment fails. Valid values are: True or False
#Status - The status of the contract. Valid values include:
#Active
#Inactive
#ExtData - Not used for this operation.
  def ManageContract(url,userName,password,transType,vendor,customerKey,contractKey,paymentInfoKey,paymentType,customerID,customerName,firstName,lastName,title,department,street1,street2,street3,city,stateID,province,zip,countryID,dayPhone,nightPhone,fax, email,mobile,contractID, contractName,billAmt,taxAmt,totalAmt,startDate,endDate,nextBillDt,billingPeriod,billingInterval,maxFailures,failureInterval,emailCustomer,emailMerchant,emailCustomerFailure,emailMerchantFailure,status,extData)
  data = 'Username='+userName+'&Password='+password+'&TransType='+transType+'&Vendor='+vendor+'&CustomerKey='+customerKey+'&ContractKey='+contractKey+'&PaymentInfoKey='+paymentInfoKey+'&PaymentType='+paymentType+'&CustomerID='+customerID+'&CustomerName='+customerName+'&FirstName='+firstName+'&LastName='+lastName+'&Title='+title+'&Department='+department+'&Street1='+street1+'&Street2='+street2+'&Street3='+street3+'&City='+city+'&StateID='+stateID+'&Province='+province+'&Zip='+zip+'&CountryID='+countryID+'&Email='+email+'&DayPhone='+dayPhone+'&NightPhone='+nightPhone+'&Fax='+fax+'&Mobile='+mobile+'&ContractID='+contractID+'&ContractName='+contractName+'&BillAmt='+billAmt+'&TaxAmt='+taxAmt+'&TotalAmt='+totalAmt+'&StartDate='+startDate+'&EndDate='+endDate+'&NextBillDt='+nextBillDt+'&BillingPeriod='+billingPeriod+'&BillingInterval='+billingInterval+'&MaxFailures='+maxFailures+'&FailureInterval='+failureInterval+'&EmailCustomer='+emailCustomer+'&EmailMerchant='+emailMerchant+'&EmailCustomerFailure='+emailCustomerFailure+'&EmailMerchantFailure='+emailMerchantFailure+'&Status='+status+'&ExtData='+extData
	
	strresponse = ""
	begin
    response = HTTParty.get(URI.encode(url+'?'+data))
    data = response.parsed_response
    if (data['RecurringResult']['Code'].to_s == "Ok")
               if (paymentType == "CC")
                strresponse = strresponse + data['RecurringResult']['Error'].to_s + ". Your CustomerKey=" + data['RecurringResult']['CustomerKey'].to_s + ", Your ContractKey=" + data['RecurringResult']['ContractKey'].to_s + "and Your CnInfo key=" + data['RecurringResult']['CcInfoKey'].to_s
                else
                  strresponse = strresponse + data['RecurringResult']['Error'].to_s + ", Your CustomerKey=" + data['RecurringResult']['CustomerKey'].to_s + ", Your ContractKey=" + data['RecurringResult']['ContractKey'].to_s + "and your CheckInfo key=" + data['RecurringResult']['CheckInfoKey'].to_s
                 end
             else
              strresponse = strresponse + data['RecurringResult']['Error'].to_s
            end
         return strresponse
    rescue Exception => e
        return e.message
    end		 
	end
end