require 'Constants'
require 'MerchantProcessCreditCardRecurringBilling'
class ProcesscreditcardrecurringbillingController < ApplicationController
  def processcreditcardrecurringbilling
  end
  def processcreditcardrecurringbillingrequest
  if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'MerchantServices.svc/ProcessCreditCard'
	   username = AppConstants::UAT_USER_NAME
	   password = AppConstants::UAT_TRANSACTION_KEY
     else
       url = AppConstants::PRODUCTION_SERVER_URL + 'MerchantServices.svc/ProcessCreditCard'
	   username = AppConstants::PRODUCTION_USER_NAME
	   password = AppConstants::PRODUCTION_TRANSACTION_KEY
    end
	vendor = params[:vendor].to_s
	ccInfoKey = params[:ccInfoKey].to_s
	amount = params[:amount].to_s
	invNum = params[:invNum].to_s
	extData = params[:extData].to_s
	
merchantProcessCreditCardRecurringBillingObj = MerchantProcessCreditCardRecurringBilling.new
@resp= merchantProcessCreditCardRecurringBillingObj.ProcessCreditCardRecurringBilling(url,username,password,vendor,ccInfoKey,amount,invNum,extData)
render 'processcreditcardrecurringbilling', :resp => @resp
   end  
end
