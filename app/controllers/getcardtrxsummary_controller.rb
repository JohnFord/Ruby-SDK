require 'Constants'
require 'ReportGetCardTrxSummary'
require 'crack'
class GetcardtrxsummaryController < ApplicationController
  def getcardtrxsummary
  end
  def getcardtrxsummaryrequest
  if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'reportingservices.svc/GetCardTrxSummary'
	   username = AppConstants::UAT_USER_NAME
	   password = AppConstants::UAT_TRANSACTION_KEY
     else
       url = AppConstants::PRODUCTION_SERVER_URL + 'reportingservices.svc/GetCardTrxSummary'
	   username = AppConstants::PRODUCTION_USER_NAME
	   password = AppConstants::PRODUCTION_TRANSACTION_KEY
    end
	rpnum = params[:rpnum].to_s
	beginDt = params[:beginDt].to_s
	endDt = params[:endDt].to_s
	approvalCode = params[:approvalCode].to_s
	register = params[:register].to_s
	nameOnCard = params[:nameOnCard].to_s
	cardNum = params[:cardNum].to_s
	cardType = params[:cardType].to_s
	excludeVoid = params[:excludeVoid].to_s
	user = params[:user].to_s
	settleFlag = params[:settleFlag].to_s
	settleMsg = params[:settleMsg].to_s
	settleDt = params[:settleDt].to_s
	extData = params[:extData].to_s
	transformType =''
	xsl = ''
	colDelim = ''
	rowDelim = ''
	includeHeader =''
	begin
	reportGetCardTrxSummaryObj = ReportGetCardTrxSummary.new
	httppartyresp =  reportGetCardTrxSummaryObj.GetCardTrxSummary(url,username,password,rpnum,beginDt,endDt,register,approvalCode,nameOnCard,cardNum,cardType,excludeVoid,user,settleFlag,settleMsg,settleDt,transformType,xsl,colDelim,rowDelim,includeHeader,extData) 
	parsedxml = Crack::XML.parse(httppartyresp)
    @resp = parsedxml["CardTrxSummary"]  
	render 'getcardtrxsummary', :resp => @resp
	rescue Exception => e
	   render 'getcardtrxsummary', :resp => e.message
	 end
  end  
end
