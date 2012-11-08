require 'rubygems'
require 'httparty'
#This class will help to retrieve the payment type transaction summary of the current open batch for a merchant<br>
class ReportGetOpenBatchSummary
#This method will return string response<br>
#URL - base url of service <br>
#UserName - Your PayLeap API login ID.<br>
#Password - Your PayLeap API transaction key.<br>
#RPNum - Your PayLeap Vendor number that uniquely identifies your merchant account.<br>
#BeginDt - The begin date of the date range in MM/DD/YYYY format. This date will be converted to: MM/DD/YYYYT00:00:00:0000AM<br>
#EndDt - The end date of the date range in MM/DD/YYYY format. This date will be converted to: MM/DD/YYYYT12:59:59:9999PM<br>
def GetOpenBatchSummary(url,userName,password,rpNum,beginDt,endDt,extData)
     data = 'UserName='+userName+'&Password='+password+'&RPNum='+rpNum+'&BeginDt='+beginDt+'&EndDt='+endDt+'&ExtData='+extData
	 strresponse = ""
	 begin
     response = HTTParty.get(URI.encode(url+'?'+data))
	 data = response.parsed_response
	 strresponse = strresponse + data['string']["__content__"].to_s
	 return strresponse
	 rescue Exception => e
        return e.message
      end
   end
end   
   