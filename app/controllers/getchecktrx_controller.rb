require 'Constants'
require 'ReportGetCheckTrx'
require 'crack'
class GetchecktrxController < ApplicationController
  def getchecktrx
  end
  def getchecktrxrequest
  if params[:URL_MODE] == 'uat'
       url = AppConstants::UAT_SERVER_URL + 'reportingservices.svc/GetCheckTrx'
	   username = AppConstants::UAT_USER_NAME
	   password = AppConstants::UAT_TRANSACTION_KEY
     else
       url = AppConstants::PRODUCTION_SERVER_URL + 'reportingservices.svc/GetCheckTrx'
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
	excludeTransType = params[:excludeTransType].to_s
	approvalCode = params[:approvalCode].to_s
	result = params[:result].to_s
	excludeResult = params[:excludeResult].to_s
	nameOnCheck = params[:nameOnCheck].to_s
	checkNum = params[:checkNum].to_s
	acctNum = params[:acctNum].to_s
	routeNum = params[:routeNum].to_s
	excludeVoid = params[:excludeVoid].to_s
	user = params[:user].to_s
	invoiceId = params[:invoiceId].to_s
	settleFlag = params[:settleFlag].to_s
	settleMsg = params[:settleMsg].to_s
	settleDt = params[:settleDt].to_s
	extData = params[:extData].to_s
	transformType = ''
	xsl = ''
	colDelim = ''
	rowDelim = ''
	includeHeader = ''
	begin
	reportGetCheckTrxObj = ReportGetCheckTrx.new
    httppartyresp = reportGetCheckTrxObj.GetCheckTrx(url,username,password,rpnum,pnref,beginDt,endDt,paymentType,excludePaymentType,transType,excludeTransType,approvalCode,result,excludeResult,nameOnCheck,checkNum,acctNum,routeNum,excludeVoid,user,invoiceId,settleFlag,settleMsg,settleDt,transformType,xsl,colDelim,rowDelim,includeHeader,extData)
	 
	parsedxml = Crack::XML.parse(httppartyresp)
    @resp = parsedxml["RichDBDS"]["TrxDetailCheck"] 
	render 'getchecktrx', :resp => @resp
     rescue Exception => e
	 @resp = e.message 
	 render 'getchecktrx', :resp => @resp 
	 end
	
  end  
end
