require 'Constants'
require 'ReportGetCardTrx'
require 'crack'
class GetcardtrxController < ApplicationController
  def getcardtrx
   @selectedHeader = 'report'
   @selectedSubMenu = 'getCardTrx'
  end
  def getcardtrxrequest
   if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'reportingservices.svc/GetCardTrx'
	   username = AppConstants::UAT_USER_NAME
	   password = AppConstants::UAT_TRANSACTION_KEY
     else
       url = AppConstants::PRODUCTION_SERVER_URL + 'reportingservices.svc/GetCardTrx'
	   username = AppConstants::PRODUCTION_USER_NAME
	   password = AppConstants::PRODUCTION_TRANSACTION_KEY
    end
	rpnum = params[:rpnum].to_s
	pnref = params[:pnref].to_s
	beginDt = params[:beginDt].to_s
    endDt = params[:endDt].to_s
    paymentType = params[:paymentType].to_s
    excludePaymentType = params[:excludePaymentType].to_s
    transType = params[:transType].to_s
    approvalCode = params[:approvalCode].to_s
    result = params[:result].to_s
    excludeResult = params[:excludeResult].to_s
    nameOnCard = params[:nameOnCard].to_s
    cardNum = params[:cardNum].to_s
    cardType = params[:cardType].to_s
    excludeCardType = params[:excludeCardType].to_s
    excludeVoid = params[:excludeVoid].to_s
    user = params[:user].to_s
    invoiceId = params[:invoiceId].to_s
    settleFlag = params[:settleFlag].to_s
	settleMsg = params[:settleMsg].to_s
	settleDt = params[:settleDt].to_s
	extData = params[:extData].to_s
	transformType =''
	xsl = ''
	colDelim =''
	rowDelim =''
	includeHeader =''
	excludeTransType = ''
	begin
	reportGetCardTrxObj = ReportGetCardTrx.new
	httppartyresp = reportGetCardTrxObj.GetCardTrx(url,username,password,rpnum,pnref,beginDt,endDt,paymentType,excludePaymentType,transType,excludeTransType,approvalCode,result,excludeResult,nameOnCard,cardNum,cardType,excludeCardType,excludeVoid,user,invoiceId,settleFlag,settleMsg,settleDt,transformType,xsl,colDelim,rowDelim,
includeHeader,extData)
    parsedxml = Crack::XML.parse(httppartyresp)
    @resp = parsedxml["RichDBDS"]["TrxDetailCard"] 
	render 'getcardtrx', :resp => @resp
	rescue Exception => e
	 @resp = e.message 
	 render 'getcardtrx', :resp => @resp 
	 end
	end  
end
