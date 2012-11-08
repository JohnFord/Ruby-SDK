require 'Constants'
require 'ReportGetOpenBatchSummary'
require 'crack'
class GetopenbatchsummaryController < ApplicationController
  def getopenbatchsummary
  end
  def getopenbatchsummaryrequest
  if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'reportingservices.svc/GetOpenBatchSummary'
	   username = AppConstants::UAT_USER_NAME
	   password = AppConstants::UAT_TRANSACTION_KEY
     else
       url = AppConstants::PRODUCTION_SERVER_URL + 'reportingservices.svc/GetOpenBatchSummary'
	   username = AppConstants::PRODUCTION_USER_NAME
	   password = AppConstants::PRODUCTION_TRANSACTION_KEY
    end
    rpnum = params[:rpnum].to_s
	beginDt = params[:beginDt].to_s
	endDt = params[:endDt].to_s
	extData = ''
	begin
	reportGetOpenBatchSummaryObj = ReportGetOpenBatchSummary.new
     httppartyresponse = reportGetOpenBatchSummaryObj.GetOpenBatchSummary(url,username,password,rpnum,beginDt,endDt,extData)
	 output = Crack::XML.parse(httppartyresponse)
     @resp = output["OpenBatchSummary"]["Table"]
     render 'getopenbatchsummary', :resp => @resp
	 rescue Exception => e
	 @resp = e.message
	 render 'getopenbatchsummary', :resp => @resp  
	 end
  end
end
