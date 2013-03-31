class MerchantManageContract
  def ManageContract(url,userName,password,transType,vendor,customerKey,contractKey,paymentInfoKey,paymentType,customerID,customerName,firstName,lastName,title,department,street1,street2,street3,city,stateID,province,zip,countryID,dayPhone,nightPhone,fax, email,mobile,contractID, contractName,billAmt,taxAmt,totalAmt,startDate,endDate,nextBillDt,billingPeriod,billingInterval,maxFailures,failureInterval,emailCustomer,emailMerchant,emailCustomerFailure,emailMerchantFailure,status,extData)
  data = 'Username='+userName+'&Password='+password+'&TransType='+transType+'&Vendor='+vendor+'&CustomerKey='+customerKey+'&ContractKey='+contractKey+'&PaymentInfoKey='+paymentInfoKey+'&PaymentType='+paymentType+'&CustomerID='+customerID+'&CustomerName='+customerName+'&FirstName='+firstName+'&LastName='+lastName+'&Title='+title+'&Department='+department+'&Street1='+street1+'&Street2='+street2+'&Street3='+street3+'&City='+city+'&StateID='+stateID+'&Province='+province+'&Zip='+zip+'&CountryID='+countryID+'&Email='+email+'&DayPhone='+dayPhone+'&NightPhone='+nightPhone+'&Fax='+fax+'&Mobile='+mobile+'&ContractID='+contractID+'&ContractName='+contractName+'&BillAmt='+billAmt+'&TaxAmt='+taxAmt+'&TotalAmt='+totalAmt+'&StartDate='+startDate+'&EndDate='+endDate+'&NextBillDt='+nextBillDt+'&BillingPeriod='+billingPeriod+'&BillingInterval='+billingInterval+'&MaxFailures='+maxFailures+'&FailureInterval='+failureInterval+'&EmailCustomer='+emailCustomer+'&EmailMerchant='+emailMerchant+'&EmailCustomerFailure='+emailCustomerFailure+'&EmailMerchantFailure='+emailMerchantFailure+'&Status='+status+'&ExtData='+extData
	
	strresponse = ""
    response = HTTParty.get(URI.encode(url+'?'+data))
    data = response.parsed_response
    if (data['RecurringResult']['Code'] == "Ok")
               if (paymentType == "CC")
                strresponse = strresponse + data['RecurringResult']['Error'] + " Your CustomerKey=" + data['RecurringResult']['CustomerKey'] + " Your ContractKey=" + data['RecurringResult']['ContractKey'] + "and Your CnInfo key=" + data['RecurringResult']['CcInfoKey']
                else
                  strresponse = strresponse + data['RecurringResult']['Error'] + " Your CustomerKey=" + data['RecurringResult']['CustomerKey'] + " Your ContractKey=" + data['RecurringResult']['ContractKey'] + "and your CheckInfo key=" + data['RecurringResult']['CheckInfoKey']
                 end
             else
              strresponse = strresponse + data['RecurringResult']['Error']
            end
            return strresponse
	end
end
