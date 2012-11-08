require 'Constants'
require 'MerchantManageCustomer'
class ManagecustomerController < ApplicationController
  def managecustomer
  end
  def managecustomerrequest
  if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'MerchantServices.svc/ManageCustomer'
	   username = AppConstants::UAT_USER_NAME
	   password = AppConstants::UAT_TRANSACTION_KEY
     else
       url = AppConstants::PRODUCTION_SERVER_URL + 'MerchantServices.svc/ManageCustomer'
	   username = AppConstants::PRODUCTION_USER_NAME
	   password = AppConstants::PRODUCTION_TRANSACTION_KEY
    end
	transType = params[:transType].to_s
	vendor = params[:vendor].to_s
	customerKey = params[:customerKey].to_s
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
	extData = params[:extData].to_s
	customerName = params[:customerName].to_s
	status = ''
	
merchantManageCustomerObj = MerchantManageCustomer.new
@resp = merchantManageCustomerObj.ManageCustomer(url,username,password,transType,vendor,customerKey,customerID,customerName,firstName,lastName,title,department,street1,street2,street3,city,stateID,province,zip,countryID,dayPhone,nightPhone,fax,email,mobile,status,extData)

 render 'managecustomer', :resp => @resp
   end
end
