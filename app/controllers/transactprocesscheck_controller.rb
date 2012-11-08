require 'TransactProcessCheck'
require 'Constants'
class TransactprocesscheckController < ApplicationController
  def transactprocesscheck
  end
  def transactprocesscheckrequest
  if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'transactservices.svc/ProcessCheck'
       username = AppConstants::UAT_USER_NAME
       password = AppConstants::UAT_TRANSACTION_KEY
    else
       url = AppConstants::PRODUCTION_SERVER_URL + 'transactservices.svc/ProcessCheck'
       username = AppConstants::PRODUCTION_USER_NAME
       password = AppConstants::PRODUCTION_TRANSACTION_KEY 
    end
    transtype = params[:transType].to_s
    checkNum = params[:checkNum].to_s
    transitNum = params[:transitNum].to_s
    accountNum = params[:accountNum].to_s
    total = params[:total].to_s
    micr = params[:micr].to_s
    nameOnCheck = params[:nameOnCheck].to_s
    dl = params[:dl].to_s
	ss = params[:ss].to_s
    dob = params[:dob].to_s
	stateCode = params[:stateCode].to_s
	checkType = params[:checkType].to_s
	extData = params[:extData].to_s
    transactProcessCheckObj = TransactProcessCheck.new   
    @resp = transactProcessCheckObj.ProcessCheck(url, username, password, transtype,checkNum, transitNum,accountNum,total, micr, nameOnCheck, dl, ss, dob, stateCode, checkType, extData)
  #render response in view
  #@post = Post.new(params[:post])
  #@post.save
  #redirect_to action: :show, id: @post.id
  #redirect_to action: :show, id: @creditcardresponse
  render 'transactprocesscheck', :resp => @resp 
   end
end
