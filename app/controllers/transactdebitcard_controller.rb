require 'TransactProcessDebitCard'
require 'Constants'
class TransactdebitcardController < ApplicationController
  def transactprocessdebitcard
  end
  def processdebitcard
if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'transactservices.svc/ProcessDebitCard'
       username = AppConstants::UAT_USER_NAME
       password = AppConstants::UAT_TRANSACTION_KEY
    else
       url = AppConstants::PRODUCTION_SERVER_URL + 'transactservices.svc/ProcessDebitCard'
       username = AppConstants::PRODUCTION_USER_NAME
       password = AppConstants::PRODUCTION_TRANSACTION_KEY
    end
    transtype = params[:transType].to_s
    cardnum = params[:cardNum].to_s
    expdate = params[:expDate].to_s
    magdata = params[:magData].to_s
    nameoncard = params[:nameOnCard].to_s
    total = params[:total].to_s
    ticketnumber = params[:ticketNumber].to_s
    refnum = params[:refNum].to_s
	pin = params[:pin].to_s
    sureChargeAmt = params[:sureChargeAmt].to_s
	cashBackAmt = params[:cashBackAmt].to_s
	registerNum = params[:registerNum].to_s
	extData = params[:extData].to_s
    transactProcessDebitCardObj = TransactProcessDebitCard.new   
    @resp = transactProcessDebitCardObj.ProcessDebitCard(url, username, password, transtype, cardnum,expdate,magdata, nameoncard, total, ticketnumber, refnum, pin, sureChargeAmt, cashBackAmt, registerNum,extData)
  #render response in view
  #@post = Post.new(params[:post])
  #@post.save
  #redirect_to action: :show, id: @post.id
  #redirect_to action: :show, id: @creditcardresponse
  render 'transactprocessdebitcard', :resp => @resp
  end  
end
