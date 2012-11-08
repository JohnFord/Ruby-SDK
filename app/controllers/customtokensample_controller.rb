require 'TransactSampleToken'
require 'Constants'
class CustomtokensampleController < ApplicationController
  def customtokensample
  end
  def customtokensamplerequest
    if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'transactservices.svc/ProcessCreditCard'
	   username = AppConstants::UAT_USER_NAME
       password = AppConstants::UAT_TRANSACTION_KEY
     else
       url = AppConstants::PRODUCTION_SERVER_URL + 'transactservices.svc/ProcessCreditCard'
	   username = AppConstants::PRODUCTION_USER_NAME
       password = AppConstants::PRODUCTION_TRANSACTION_KEY 
    end
    transType = params[:transType].to_s
	vendorNum = params[:vendor].to_s
	cardNum = params[:cardNum].to_s
	expDate = params[:expDate].to_s
	magData = params[:magData].to_s
	nameOnCard = params[:nameOnCard].to_s
	total = params[:total].to_s
	ticketNumber = params[:ticketNumber].to_s
	refNum = params[:refNum].to_s
	zip = params[:zip].to_s
	street = params[:street].to_s
	cvNumber = params[:cvNumber].to_s
	extData = params[:extData].to_s
	
transactSampleTokenObj = TransactSampleToken.new
	      @resp = transactSampleTokenObj.SampleToken(url,username,password,transType,cardNum,vendorNum,expDate,magData,nameOnCard,total,ticketNumber,refNum,zip,street,cvNumber, extData)
		  
		  render 'customtokensample', :resp => @resp
	
  end
end
