require 'TransactValidExpDate'
require 'Constants'
class TransactvalidexpdateController < ApplicationController
  def transactvalidexpdate
  end
  def transactvalidexpdaterequest
  if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'transactservices.svc/ValidExpDate'
     else
       url = AppConstants::PRODUCTION_SERVER_URL + 'transactservices.svc/ValidExpDate'
    end
    
    expDate = params[:expDate].to_s
    transactValidExpDateObj = TransactValidExpDate.new   
    @resp = transactValidExpDateObj.ValidExpDate(url,expDate)
  #render response in view
  #@post = Post.new(params[:post])
  #@post.save
  #redirect_to action: :show, id: @post.id
  #redirect_to action: :show, id: @creditcardresponse
  render 'transactvalidexpdate', :resp => @resp
  end  
end
