require 'Constants'
require 'MerchantManageCreditCardInfo'
class ManagecreditinfoController < ApplicationController
  def managecreditinfo
  end
  def managecreditinforequest
  if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'MerchantServices.svc/ManageCreditCardInfo'
	   username = AppConstants::UAT_USER_NAME
	   password = AppConstants::UAT_TRANSACTION_KEY
     else
       url = AppConstants::PRODUCTION_SERVER_URL + 'MerchantServices.svc/ManageCreditCardInfo'
	   username = AppConstants::PRODUCTION_USER_NAME
	   password = AppConstants::PRODUCTION_TRANSACTION_KEY
    end
	
	transType = params[:transType].to_s
	vendor = params[:vendor].to_s
	customerKey = params[:customerKey].to_s
	cardInfoKey = params[:cardInfoKey].to_s
	ccAccountNum = params[:ccAccountNum].to_s
	ccExpDate = params[:ccExpDate].to_s
	ccNameonCard = params[:ccNameonCard].to_s
	ccStreet = params[:ccStreet].to_s
	ccZip = params[:ccZip].to_s
	extData = params[:extData].to_s
	
	merchantManageCreditCardInfoObj = MerchantManageCreditCardInfo.new
	@resp = merchantManageCreditCardInfoObj.ManageCreditCardInfo(url,username,password,transType,vendor,customerKey,cardInfoKey,ccAccountNum,ccExpDate, ccNameonCard,ccStreet,ccZip,extData)
	
	render 'managecreditinfo', :resp => @resp
	
  end
end
