require 'rubygems'
require 'httparty'
#ReportGetCheckTrx class will help to retrieve check transaction details for a merchant	<br>
class ReportGetCheckTrx
#GetCheckTrx will return string response<br>
#Parameters accespted by GetCheckTrx are :  <br>
#Url - base url of service <br>
#UserName - Your PayLeap API login ID.<br>
#Password - Your PayLeap API transaction key.<br>
#RPNum - Your PayLeap Vendor number that uniquely identifies your merchant account.<br>
#PNRef - To search for a single transaction, provide the unique payment reference number assigned to the transaction. If this field is provided, all other query fields are ignored.<br>
#BeginDt - Required, except when PNRef is provided.<br>
#The begin date of the date range in MM/DD/YYYY (or YYYY-MM-DD or YYYY-MM-DDThh:mm:ss) format. This date will be converted to YYYY-MM-DDThh:mm:ss (time is in 24-hour format). If the submitted value does not contain time information, BeginDt defaults to midnight on the given date. For example:<br>
#2005-08-19T12:00:12 is kept as is.<br>
#2005-08-19 becomes 2005-08-19T00:00:00.<br>
#2005/08/19 becomes 2005-08-19T00:00:00.<br>
#08/19/2005 becomes 2005-08-19T00:00:00.<br>
#The reporting service returns transactions whose date is greater than or equal to the begin date.<br>
#EndDt - The end date of the date range in MM/DD/YYYY (or YYYY-MM-DD or YYYY-MM-DDThh:mm:ss) format. This date will be converted to YYYY-MM-DDThh:mm:ss (time is in 24-hour format). If the submitted value does not contain time information, EndDt increments to the next day at midnight, such that no transaction on the desired end date will be excluded based on its time. For example:<br>
#2005-08-19T12:00:12 is kept as is.<br>
#2005-08-19 becomes 2005-08-20T00:00:00.<br>
#08/19/2005 becomes 2005-08-20T00:00:00.<br>
#The reporting service returns transactions whose date is less than the end date.<br>
#PaymentType - The type of card used for payment. If provided, only those transactions matching the PaymentType will be included. See Check Payment Type Request Codes on page 34 for valid values.<br>
#To include multiple payment types, submit each desired type separated by commas. For example, “ACH, ECHECK” will pull all transactions with either ACH or ECHECK payment types.<br>
#ExcludePaymentType - Indicates which PaymentType(s) to exclude from the response. If provided, any transaction matching the ExcludePaymentType will be excluded. See Check Payment Type Request Codes on page 34 for valid values.<br>
#TransType - The transaction type being performed. If provided, only those transactions matching the TransType will be included. See Transaction Type Request Codes on page 35 for valid values.<br>
#To include multiple payment types, submit each desired type separated by commas. For example: "Credit,Sale" will pull all transactions with either Credit or Sale transaction types.<br>
#ExcludeTransType - Indicates which TransType(s) to exclude from the response. If provided, any transaction matching the ExcludeTransType will be excluded. See Transaction Type Request Codes on page 35 for valid values.<br>
#ApprovalCode - The code returned by PayLeap for approved transactions. If provided, only those transactions matching the ApprovalCode parameter will be included.<br>
#Result - The transaction result code from PayLeap. If provided, only those transactions matching the Result will be included. Valid values are:<br>
#0 (approved)<br>
#All other values represent a declined transaction. To return all declined transactions, you should leave this field empty and set the ExcludeResult to 0 instead.<br>
#ExcludeResult - Indicates which Result code(s) to exclude from the response. If provided, any transactions matching the ExcludeResult will be excluded.<br>
#NameOnCheck - The customer’s name as it is appears on the check, if provided. Only those transactions with the customer’s name matching NameOnCheck will be included. This parameter uses partial matching. For example: "test" matches "test","1test" and "1test234".<br>
#CheckNum - A check number. If provided, only those transactions with matching CheckNum will be included.
#AcctNum - The customer’s checking account number. If provided, only those transactions matching the AcctNum will be included. This parameter uses partial matching.<br>
#RouteNum - The routing number printed on the check. Any transactions matching the RouteNum (Transit Number) will be included. This parameter uses partial matching.<br>
#ExcludeVoid - An option to exclude voided transactions. Valid values are: TRUE or FALSE. The default value is TRUE.
#User - The user who originated the transactions. If provided, only those transactions created by the matching User will be included. This parameter uses partial matching.<br>
#InvoiceId - The invoice ID that was included in the original transaction. If provided, only those transactions with matching InvoiceId will be included. This parameter uses partial matching.<br>
#SettleFlag - An option to retrieve the settled or unsettled transactions. Valid values are: TRUE or FALSE.
#SettleMsg - The settlement ID or message returned from the host.<br>
#SettleDt - The settlement timestamp in MM/DD/YYYYT00:00:00AM format.<br>
#TransformType<br>
#The type of format to transform the data into. Valid values are:<br>
#XML - outputs the plain XML string.<br>
#XSL - uses XSL to transform the XML output.<br>
#DELIM - uses ColDelim and RowDelim to format the output.<br>
#The default value is XML.<br>
#Xsl - The XSL to transform the resulting dataset. This field is used only if the TransformType is XSL. If provided, the <br>resulting dataset will be transformed using this XSL. You may pass in a URL to the XSL file, or the XSL string itself.<br> If this field is not empty, the Web Service tries to locate the file from the URL. If that fails, the Web <br>Service treats it as an XSL string. The final XSL string will be loaded and validated against the XSL schema; if it <br>passes, then that XSL will be used for transformation. For a tab-delimited transformation, a sample, predefined XSL is provided here:<br>
#http://test.payleap.com/admin/ws/TabDelim.xsl<br>
#ColDelim - The string that separates each field. This field is used only if the TransformType is DELIM.<br>
#RowDelim - The string that separates each transaction. This field is used only if the TransformType is DELIM.<br>
#IncludeHeader - An option to include field headers in the first row using the same delimiter strings. This field is used only if the TransformType is DELIM. Valid values are: TRUE or FALSE.<br>
#ExtData - An XML string containing additional data for the transaction. See the following section for more information.<br>
def GetCheckTrx(url,userName,password,rpNum,pnRef,beginDt,endDt,paymentType,excludePaymentType,transType,excludeTransType,approvalCode,result,excludeResult,nameOnCheck,checkNum,acctNum,routeNum,excludeVoid,user,invoiceId,settleFlag,settleMsg,settleDt,transformType,xsl,colDelim,rowDelim,includeHeader,extData)
  
  data = 'UserName='+userName+'&Password='+password+'&RPNum='+rpNum+'&PNRef='+pnRef+'&BeginDt='+beginDt+'&EndDt='+endDt+'&PaymentType='+paymentType+'&ExcludePaymentType='+excludePaymentType+'&TransType='+transType+'&ExcludeTransType='+excludeTransType+'&ApprovalCode='+approvalCode+'&Result='+result+'&ExcludeResult='+excludeResult+'&NameOnCheck='+nameOnCheck+'&CheckNum='+checkNum+'&AcctNum='+acctNum+'&RouteNum='+routeNum+'&ExcludeVoid='+excludeVoid+'&User='+user+'&InvoiceId='+invoiceId+'&SettleFlag='+settleFlag+'&SettleMsg='+settleMsg+'&SettleDt='+settleDt+'&TransformType='+transformType+'&Xsl='+xsl+'&ColDelim='+colDelim+'&RowDelim='+rowDelim+'&IncludeHeader='+includeHeader+'&ExtData='+extData
    strresponse = ""
	begin
    response = HTTParty.get(URI.encode(url+'?'+data))
	data = response.parsed_response
	result = data['string']["__content__"].to_s
	strresponse = strresponse + result
  return strresponse
  rescue Exception => e
        return e.message
    end
  end
end