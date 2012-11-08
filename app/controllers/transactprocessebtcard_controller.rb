require 'TransactProcessEBTCard'
require 'Constants'
class TransactprocessebtcardController < ApplicationController
  def transactprocessebtcard
  end
  def transactprocessebtcardrequest
  if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'transactservices.svc/ProcessEBTCard'
       username = AppConstants::UAT_USER_NAME
       password = AppConstants::UAT_TRANSACTION_KEY
    else
       url = AppConstants::PRODUCTION_SERVER_URL + 'transactservices.svc/ProcessEBTCard'
       username = AppConstants::PRODUCTION_USER_NAME
       password = AppConstants::PRODUCTION_TRANSACTION_KEY
    end
    transtype = params[:transType].to_s
    cardNum = params[:cardNum].to_s
    expDate = params[:expDate].to_s
    magData = params[:magData].to_s
    nameOnCard = params[:nameOnCard].to_s
    total = params[:total].to_s
    ticketNumber = params[:ticketNumber].to_s
    refNum = params[:refNum].to_s
	pin = params[:pin].to_s
    sureChargeAmt = params[:sureChargeAmt].to_s
	cashBackAmt = params[:cashBackAmt].to_s
	registerNum = params[:registerNum].to_s
	extData = params[:extData].to_s
    transactProcessEBTCardObj = TransactProcessEBTCard.new   
    @resp = transactProcessEBTCardObj.ProcessEBTCard(url, username, password, transtype,cardNum, expDate,magData,nameOnCard, total, ticketNumber, refNum, pin, sureChargeAmt, cashBackAmt, registerNum, extData)
  #render response in view
  #@post = Post.new(params[:post])
  #@post.save
  #redirect_to action: :show, id: @post.id
  #redirect_to action: :show, id: @creditcardresponse
  render 'transactprocessebtcard', :resp => @resp 
  end  
end
