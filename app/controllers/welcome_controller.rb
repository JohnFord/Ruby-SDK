require 'TransactProcessCreditCard'
require 'Constants'
class WelcomeController < ApplicationController
  def index
  end
  
  def create

   if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'transactservices.svc/ProcessCreditCard'
       username = AppConstants::UAT_USER_NAME
       password = AppConstants::UAT_TRANSACTION_KEY
    else
       url = AppConstants::PRODUCTION_SERVER_URL + 'transactservices.svc/ProcessCreditCard'
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
    zip = params[:zip].to_s
    street = params[:street].to_s
    cvnumber = params[:cvNumber].to_s
    extdata = params[:extData].to_s
    
    processcreditcard = TransactProcessCreditCard.new   
    @resp = processcreditcard.ProcessCreditCard(url, username, password, transtype, cardnum,expdate,magdata, nameoncard, total, ticketnumber, refnum, zip, street, cvnumber, extdata)
  #render response in view
  #@post = Post.new(params[:post])
  #@post.save
  #redirect_to action: :show, id: @post.id
  #redirect_to action: :show, id: @creditcardresponse
  render 'index', :resp => @resp
end
def show
   @post = Post.find(params[:id])
end
end
