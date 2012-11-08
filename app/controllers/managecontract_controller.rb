require 'Constants'
require 'MerchantManageContract'
class ManagecontractController < ApplicationController
  def managecontract
  end
  def managecontractrequest
  if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'MerchantServices.svc/ManageContract'
	   username = AppConstants::UAT_USER_NAME
	   password = AppConstants::UAT_TRANSACTION_KEY
     else
       url = AppConstants::PRODUCTION_SERVER_URL + 'MerchantServices.svc/ManageContract'
	   username = AppConstants::PRODUCTION_USER_NAME
	   password = AppConstants::PRODUCTION_TRANSACTION_KEY
    end
	
	transType = params[:transType].to_s
	vendor = params[:vendor].to_s
	customerKey = params[:customerKey].to_s
	contractKey = params[:contractKey].to_s
	paymentInfoKey = params[:paymentInfoKey].to_s
	paymentType = params[:paymentType].to_s
	customerID = params[:customerID].to_s
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
	dayPhone = params[:dayPhone].to_s
	nightPhone = params[:nightPhone].to_s
	fax = params[:fax].to_s
	email = params[:email].to_s
	mobile = params[:mobile].to_s
	contractID = params[:contractID].to_s
	contractName = params[:contractName].to_s
	billAmt = params[:billAmt].to_s
	taxAmt = params[:taxAmt].to_s
	totalAmt = params[:totalAmt].to_s
	startDate = params[:startDate].to_s
	endDate = params[:endDate].to_s
	nextBillDt = params[:nextBillDt].to_s
	billingPeriod = params[:billingPeriod].to_s
	billingInterval = params[:billingInterval].to_s
	maxFailures = params[:maxFailures].to_s
	failureInterval = params[:failureInterval].to_s
	emailCustomer = params[:emailCustomer].to_s
	emailMerchant = params[:emailMerchant].to_s
	emailCustomerFailure = params[:emailCustomerFailure].to_s
	emailMerchantFailure = params[:emailMerchantFailure].to_s
	status = params[:status].to_s
	extData = params[:extData].to_s
	customerName = params[:customerName].to_s
	
	merchantManageContractObj = MerchantManageContract.new
	@resp = merchantManageContractObj.ManageContract(url,username,password,transType,vendor,customerKey,contractKey,paymentInfoKey,paymentType,customerID,customerName,firstName,lastName,title,department,street1,street2,street3,city,stateID,province,zip,countryID,dayPhone,nightPhone,fax, email,mobile,contractID, contractName,billAmt,taxAmt,totalAmt,startDate,endDate,nextBillDt,billingPeriod,billingInterval,maxFailures,failureInterval,emailCustomer,emailMerchant,emailCustomerFailure,emailMerchantFailure,status,extData)
	
	
	render 'managecontract', :resp => @resp
	
	
	
  end
end
