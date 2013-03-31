#This class handles send a check transaction operation
class TransactProcessCheck
#This method returns string response
#url - base url of service
#UserName - Your PayLeap API login ID.
#Password - Your PayLeap API transaction key.
#TransType - The transaction type being performed. Always: Sale
#CheckNum - The check number printed on the check.
#TransitNum - The routing number printed on the check
#AccountNum - The account number printed on the check.
#Amount - The dollar amount of the transaction in DDDDDDDDDD.CC format.
#MICR - Conditional based on SecCode
#The raw MICR data from the check in the following format.
#[TransitNum]T[AccountNum]O[CheckNum]
#Required only for the following SecCode values specified in ExtData: POP, BOC, ARC, C21
#NameOnCheck - The customer’s name as printed on the check.
#DL - The customer’s driver’s license number. Usage varies by check processor.
#SS - The customer’s social security number. Usage varies by check processor.
#DOB - The customer’s date of birth in MM/DD/YYYY format. Usage varies by check processor.
#StateCode - The customer’s two-digit driver’s license state or province code. Usage varies by check processor.
#CheckType - The type of bank account on which the check draws. Valid values are:
#Personal
#Corporate
#Government
#ExtData - An XML string containing additional data for the transaction. See the following section for more information.
   def ProcessCheck(url,username,password,transtype,checknum,transitnum,acountnum,amount,micr,nameoncheck,dl,ss,dob,statecode,checktype,extdata)
   data = 'UserName=' + username + '&Password=' +password+ '&TransType=' + transtype + '&CheckNum=' + checknum + '&TransitNum=' + transitnum + '&AccountNum=' + acountnum + '&Amount=' + amount + '&MICR=' + micr + '&NameOnCheck=' + nameoncheck + '&DL='  + dl + '&SS=' + ss + '&DOB=' + dob + '&StateCode=' + statecode + '&CheckType=' + checktype +  '&ExtData=' + extdata
    strresponse = ""
	begin
	response = HTTParty.get(URI.encode(url+'?'+data))
    data = response.parsed_response
    result = String.new(data['Response']['Result'].to_s)

    case result
    when '0'
      strresponse += 'Good' + ","
       if(!data['Response']['RespMSG'].nil?)
       if data['Response']['RespMSG'].length > 0 
           strresponse = strresponse + "Response: " + data['Response']['RespMSG']+ ","
          end
       end
     if(!data['Response']['AuthCode'].nil?)  
      if data['Response']['AuthCode'].length > 0 
           strresponse = strresponse + "Approval Code: " + data['Response']['AuthCode']+ ","
          end
        end
     if(!data['Response']['PNRef'].nil?)   
      if data['Response']['PNRef'].length > 0 
           strresponse = strresponse + "Reference Number: " + data['Response']['PNRef']+ ","
          end
       end
	  if(!data['Response']['GetAVSResult'].nil?)  
      if data['Response']['GetAVSResult'].length > 0 
           strresponse = strresponse + "AVS Match: " + data['Response']['GetAVSResult']+ ","
          end
       end
	   if(!data['Response']['GetCVResult'].nil?) 
       if data['Response']['GetCVResult'].length > 0 
           strresponse = strresponse + "CV Match: " + data['Response']['GetCVResult']+ "."
          end
		end  
      else
      strresponse = 'Bad'+","
      strresponse = strresponse + 'Error Number:  '+data['Response']['Result'].to_s+","
      strresponse = strresponse + 'Result: '+data['Response']['RespMSG'].to_s+","
      strresponse = strresponse + 'Status:  '+data['Response']['Message1'].to_s+"."
      end
     return strresponse
	 rescue Exception => e
        return e.message
     end
   end
end

