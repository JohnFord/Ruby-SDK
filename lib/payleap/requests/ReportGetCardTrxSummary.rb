#ReportGetCardTrxSummary class will help to retrieve a summary of card payments for a merchant<br>
#ReportGetCardTrxSummary will return string response<br>
class ReportGetCardTrxSummary
#url - base url of service<br>
#UserName - Your PayLeap API login ID.<br>
#Password - Your PayLeap API transaction key.<br>
#RPNum - Your PayLeap Vendor number that uniquely identifies your merchant account.<br>
#BeginDt - The begin date of the date range in MM/DD/YYYY format.<br>
#EndDt - The inclusive end date of the date range in MM/DD/YYYY format.<br>
#ApprovalCode - The code returned by PayLeap for approved transactions. If provided, only those transactions matching the ApprovalCode parameter will be included.<br>
#Register - The register that originated the transaction. If provided, only those transactions with the matching register will be included.<br>
#NameOnCard - Cardholder’s name as it is appears on the card.<br><br> If provided, only those transactions with cardholder’s name matching NameOnCard will be included. This parameter uses partial matching. <br>For example: "test" matches "test","1test" and "1test234".<br>
#CardNum - A card number. If provided, <br>only those transactions with the cardholder's name matching CardNum will be included.<br> This parameter uses partial matching.<br>
#CardType - A type of credit card. If provided,<br> only those transactions matching the CardType will be included.<br> See Card Type Request Codes on page 35 for valid values.<br>
#To include multiple payment types, submit each desired type separated by commas.<br> For example, "'VISA,MASTER,DISCOVER" will pull all transactions with either VISA, MASTER and DISCOVER card type.<br>
#ExcludeVoid - An option to exclude voided transactions. Valid values are: TRUE or FALSE.<br> The default value is TRUE.<br>
#User - The user who originated the transactions.<br> If provided, only those transactions created by the matching User will be included. This parameter uses partial matching.<br>
#SettleFlag - An option to retrieve the settled transactions or unsettled transactions.<br> Valid values are: TRUE or FALSE.
#SettleMsg - The settlement ID or message returned from the host.<br>
#SettleDt - The settlement timestamp in MM/DD/YYYYT00:00:00AM format.<br>
#TransformType -The type of format to transform the data into. Valid values are:<br>
#XML - outputs the plain XML string.<br>
#XSL - uses XSL to transform the XML output.<br>
#DELIM - uses ColDelim and RowDelim to format the output.<br>
#The default value is XML.<br>
#Xsl - The XSL to transform the resulting dataset. This field is used only if the TransformType is XSL. <br>If provided, the resulting dataset will be transformed using this XSL. You may pass in a URL to the XSL file, or the XSL string itself. If <br>this field is not empty, the Web Service tries to locate the file from the URL. If that fails,<br> the Web Service treats it as an XSL string.<br> The final XSL string will be loaded and validated against the XSL schema; if it passes, then that XSL will be used for transformation. <br>For a tab-delimited transformation, a sample, predefined XSL is provided here:
#http://test.payleap.com/admin/ws/TabDelim.xsl<br>
#ColDelim - The string that separates each field. This field is used only if the TransformType is DELIM.<br>
#RowDelim - The string that separates each transaction. This field is used only if the TransformType is DELIM.<br>
#IncludeHeader - An option to include field headers in the first row using the same delimiter strings. This field is used <br>only if the TransformType is DELIM. Valid values are: TRUE or FALSE.<br>
#ExtData - Not used for this operation.<br>

def GetCardTrxSummary(url,userName,password,rpNum,beginDt,endDt,register,approvalCode,nameOnCard,cardNum,cardType,excludeVoid,user,settleFlag,settleMsg,settleDt,transformType,xsl,colDelim,rowDelim,includeHeader,extData)

data = 'UserName='+userName+'&Password='+password+'&RPNum='+rpNum+'&BeginDt='+beginDt+'&EndDt='+endDt+'&Register='+register+'&ApprovalCode='+approvalCode+'&NameOnCard='+nameOnCard+'&CardNum='+cardNum+'&CardType='+cardType+'&ExcludeVoid='+excludeVoid+'&User='+user+'&SettleFlag='+settleFlag+'&SettleMsg='+settleMsg+'&SettleDt='+settleDt+'&TransformType='+transformType+'&Xsl='+xsl+'&ColDelim='+colDelim+'&RowDelim='+rowDelim+'&IncludeHeader='+includeHeader+'&ExtData='+extData
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
