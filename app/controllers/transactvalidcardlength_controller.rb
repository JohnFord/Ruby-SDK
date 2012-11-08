require 'TransactValidCardLength'
require 'Constants'
class TransactvalidcardlengthController < ApplicationController
  def transactvalidcardlength
  end
  def transactvalidcardlengthrequest
  if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'transactservices.svc/ValidCardLength'
     else
       url = AppConstants::PRODUCTION_SERVER_URL + 'transactservices.svc/ValidCardLength'
    end
    
    cardNum = params[:cardNum].to_s
    transactValidCardLengthObj = TransactValidCardLength.new   
    @resp = transactValidCardLengthObj.ValidCardLength(url,cardNum)
  #render response in view
  #@post = Post.new(params[:post])
  #@post.save
  #redirect_to action: :show, id: @post.id
  #redirect_to action: :show, id: @creditcardresponse
  render 'transactvalidcardlength', :resp => @resp
  end  
end
