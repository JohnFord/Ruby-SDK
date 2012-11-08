require 'Constants'
require 'MerchantManageCheckInfo'
class ManagecheckinfoController < ApplicationController
  def managecheckinfo
  end
  def managecheckinforequest
  if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'MerchantServices.svc/ManageCheckInfo'
	   username = AppConstants::UAT_USER_NAME
	   password = AppConstants::UAT_TRANSACTION_KEY
     else
       url = AppConstants::PRODUCTION_SERVER_URL + 'MerchantServices.svc/ManageCheckInfo'
	   username = AppConstants::PRODUCTION_USER_NAME
	   password = AppConstants::PRODUCTION_TRANSACTION_KEY
    end
	transType = params[:transType].to_s
	vendor = params[:vendor].to_s
	customerKey = params[:customerKey].to_s
	checkInfoKey = params[:checkInfoKey].to_s
	checkType = params[:checkType].to_s
	accountType = params[:accountType].to_s
	checkNum = params[:checkNum].to_s
	micr = params[:micr].to_s
	accountNum = params[:accountNum].to_s
	transitNum = params[:transitNum].to_s
	ss = params[:ss].to_s
	dob = params[:dob].to_s
	branchCity = params[:branchCity].to_s
	dl = params[:dl].to_s
	stateCode = params[:stateCode].to_s
	nameOnCheck = params[:nameOnCheck].to_s
	email = params[:email].to_s
	dayPhone = params[:dayPhone].to_s
	street1 = params[:street1].to_s
	street2 = params[:street2].to_s
	street3 = params[:street3].to_s
	city = params[:city].to_s
	stateID = params[:stateID].to_s
	province = params[:province].to_s
	postalCode = params[:postalCode].to_s
	countryID = params[:countryID].to_s
	extData = params[:extData].to_s
	
	  merchantManageCheckInfoObj = MerchantManageCheckInfo.new
	  @resp = merchantManageCheckInfoObj.ManageCheckInfo(url,username,password,transType, vendor, customerKey, checkInfoKey, checkType,accountType,checkNum,micr, accountNum, transitNum, ss, dob, branchCity, dl, stateCode, nameOnCheck, email, dayPhone,street1,street2,street3,city, stateID,province, postalCode, countryID, extData)
	  
	render 'managecheckinfo', :resp => @resp
	
  end  
end
