require 'Constants'
require 'MerchantAddRecurringCheck'
class AddrecurringcheckController < ApplicationController
  def addrecurringcheck
  end
  def addrecurringcheckrequest
  if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'MerchantServices.svc/AddRecurringCheck'
	   username = AppConstants::UAT_USER_NAME
	   password = AppConstants::UAT_TRANSACTION_KEY
     else
       url = AppConstants::PRODUCTION_SERVER_URL + 'MerchantServices.svc/AddRecurringCheck'
	   username = AppConstants::PRODUCTION_USER_NAME
	   password = AppConstants::PRODUCTION_TRANSACTION_KEY
    end
	vendor = params[:vendor].to_s
	customerID = params[:customerID].to_s
	customerName = params[:customerName].to_s
	firstName = params[:firstName].to_s
	lastName = params[:lastName].to_s
	title = params[:title].to_s
	department = params[:department].to_s
	street1 = params[:street1].to_s
	street2 = params[:street2].to_s
	street3 = params[:street3].to_s
	city = params[:city].to_s
	stateID = params[:stateID].to_s
	province = params[:province].to_s
	zip = params[:zip].to_s
	countryID = params[:countryID].to_s
	email = params[:email].to_s
	mobile = params[:mobile].to_s
	contractID = params[:contractID].to_s
	contractName = params[:contractName].to_s
	billAmt = params[:billAmt].to_s
	taxAmt = params[:taxAmt].to_s
	totalAmt = params[:totalAmt].to_s
	startDate = params[:startDate].to_s
	endDate = params[:endDate].to_s
	billingPeriod = params[:billingPeriod].to_s
	billingInterval = params[:billingInterval].to_s
	maxFailures = params[:maxFailures].to_s
	failureInterval = params[:failureInterval].to_s
	emailCustomer = params[:emailCustomer].to_s
	emailMerchant = params[:emailMerchant].to_s
	emailCustomerFailure = params[:emailCustomerFailure].to_s
	emailMerchantFailure = params[:emailMerchantFailure].to_s
	checkType = params[:checkType].to_s
	accountType = params[:accountType].to_s
	checkNum = params[:checkNum].to_s
	micr = params[:micr].to_s
	accountNum = params[:accountNum].to_s
	transitNum = params[:transitNum].to_s
	sS = params[:ss].to_s
	doB = params[:dob].to_s
	branchCity = params[:branchCity].to_s
	dL = params[:dl].to_s
	stateCode = params[:stateCode].to_s
	nameOnCheck = params[:nameOnCheck].to_s
	extData = params[:extData].to_s
	
merchantAddRecurringCheckObj = MerchantAddRecurringCheck.new
@resp = merchantAddRecurringCheckObj.AddRecurringCheck(url,username,password,vendor,customerID,customerName,firstName,lastName,title,department,street1,street2,street3,city,stateID,province,zip,countryID,email,mobile,contractID,contractName,billAmt,taxAmt,totalAmt,startDate,endDate,billingPeriod,billingInterval,maxFailures,failureInterval,emailCustomer,emailMerchant,emailCustomerFailure,emailMerchantFailure,checkType,accountType,checkNum,micr,accountNum,transitNum,sS,doB,branchCity,dL,stateCode,nameOnCheck,extData)
 render 'addrecurringcheck', :resp => @resp 		   
  end
end
