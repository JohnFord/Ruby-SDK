#This class will help to retrieve information related to your merchant account<br>
class ReportGetInfo
#This method returns string response<br>
#URL - base url of service<br>
#UserName - Your PayLeap API login ID.<br>
#Password - Your PayLeap API transaction key.<br>
#TransType - The transaction type being performed. See GetInfo TransType Request Codes on page 35 for valid values.<br>
#ExtData - An XML string containing additional data for the transaction. See the following section for more information.<br>
  def GetInfo(url,userName,password,transType,extData)
    data = 'UserName='+userName+'&Password='+password+'&TransType='+transType+'&ExtData='+extData
	strresponse = ""
	begin
    response = HTTParty.get(URI.encode(url+'?'+data))
	data = response.parsed_response
    return data["Response"]
	rescue Exception => e
        return e.message
      end
  end
end
