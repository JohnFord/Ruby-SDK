require 'Constants'
require 'TransactValidMod10'
class Transactvalidmod10Controller < ApplicationController
  def transactvalidmod10
  end
  def transactvalidmod10request
  
  if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'transactservices.svc/ValidMod10'
   else
       url = AppConstants::PRODUCTION_SERVER_URL + 'transactservices.svc/ValidMod10'
    end
    
	cardNum = params[:cardNum].to_s
    transactValidMod10Obj = TransactValidMod10.new   
    @resp = transactValidMod10Obj.ValidMod10(url,cardNum)
   
   render 'transactvalidmod10', :resp => @resp
   end
end
