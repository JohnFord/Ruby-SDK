require 'Constants'
require 'MerchantProcessCheckRecurringBilling'
class ProcesscheckrecurringbillingController < ApplicationController
  def processcheckrecurringbilling
  end
  def processcheckrecurringbillingrequest
    if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'MerchantServices.svc/ProcessCheck'
	   username = AppConstants::UAT_USER_NAME
	   password = AppConstants::UAT_TRANSACTION_KEY
     else
       url = AppConstants::PRODUCTION_SERVER_URL + 'MerchantServices.svc/ProcessCheck'
	   username = AppConstants::PRODUCTION_USER_NAME
	   password = AppConstants::PRODUCTION_TRANSACTION_KEY
    end
	vendor = params[:vendor].to_s
	checkInfoKey = params[:checkInfoKey].to_s
	amount = params[:amount].to_s
	invNum = params[:invNum].to_s
	extData = params[:extData].to_s
	
	merchantProcessCheckRecurringBillingObj = MerchantProcessCheckRecurringBilling.new
	@resp = merchantProcessCheckRecurringBillingObj.ProcessCheckRecurringBilling(url,username,password,vendor,checkInfoKey,amount,invNum,extData)
	
	render 'processcheckrecurringbilling', :resp => @resp
	
  end
end
