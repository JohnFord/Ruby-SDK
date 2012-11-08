require 'Constants'
require 'ReportGetInfo'
require 'crack'
class GetinfoController < ApplicationController
  def getinfo
  end
  def getinforequest
   if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'reportingservices.svc/GetInfo'
	   username = AppConstants::UAT_USER_NAME
	   password = AppConstants::UAT_TRANSACTION_KEY
     else
       url = AppConstants::PRODUCTION_SERVER_URL + 'reportingservices.svc/GetInfo'
	   username = AppConstants::PRODUCTION_USER_NAME
	   password = AppConstants::PRODUCTION_TRANSACTION_KEY
    end
	transType = params[:transType].to_s
	extData = params[:extData].to_s
	begin
	reportGetInfoObj = ReportGetInfo.new
	@resp = reportGetInfoObj.GetInfo(url,username,password,transType,extData)
	 #if(transType.eql?("Initialize"))
       #@resp = Crack::XML.parse(response["ExtData"])
	   #render 'getinfo', :resp => @resp
	   #else
       #end	  
	   render 'getinfo', :resp => @resp
	   rescue Exception => e
	   @resp = e.message 
	   render 'getinfo', :resp => @resp 
	 end
	 
  end
end
