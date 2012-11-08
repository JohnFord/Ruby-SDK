require 'TransactProcessGiftCard'
require 'Constants'
class TransactprocessgiftcardController < ApplicationController
  def transactprocessgiftcard
  end
  def transactprocessgiftcardrequest
  if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'transactservices.svc/ProcessGiftCard'
       username = AppConstants::UAT_USER_NAME
       password = AppConstants::UAT_TRANSACTION_KEY
    else
       url = AppConstants::PRODUCTION_SERVER_URL + 'transactservices.svc/ProcessGiftCard'
       username = AppConstants::PRODUCTION_USER_NAME
       password = AppConstants::PRODUCTION_TRANSACTION_KEY
    end
    transtype = params[:transType].to_s
    cardNum = params[:cardNum].to_s
    expDate = params[:expDate].to_s
    magData = params[:magData].to_s
    total = params[:total].to_s
    ticketNumber = params[:ticketNumber].to_s
    refNum = params[:refNum].to_s
    extData = params[:extData].to_s
    transactProcessGiftCardObj = TransactProcessGiftCard.new   
    @resp = transactProcessGiftCardObj.ProcessGiftCard(url, username, password, transtype,cardNum, expDate,magData,total, ticketNumber, refNum,extData)
  #render response in view
  #@post = Post.new(params[:post])
  #@post.save
  #redirect_to action: :show, id: @post.id
  #redirect_to action: :show, id: @creditcardresponse
  render 'transactprocessgiftcard', :resp => @resp
  end
end
