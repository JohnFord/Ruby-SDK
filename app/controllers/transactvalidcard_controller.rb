require 'TransactValidCard'
require 'Constants'
class TransactvalidcardController < ApplicationController
  def transactvalidcard
  end
  def transactvalidcardrequest
    if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'transactservices.svc/ValidCard'
       else
       url = AppConstants::PRODUCTION_SERVER_URL + 'transactservices.svc/ValidCard'
      end
    
    cardNum = params[:cardNum].to_s
    expDate = params[:expDate].to_s
    transactValidCardObj = TransactValidCard.new   
    @resp = transactValidCardObj.ValidCard(url,cardNum,expDate)
  #render response in view
  #@post = Post.new(params[:post])
  #@post.save
  #redirect_to action: :show, id: @post.id
  #redirect_to action: :show, id: @creditcardresponse
  render 'transactvalidcard', :resp => @resp
  end
end
