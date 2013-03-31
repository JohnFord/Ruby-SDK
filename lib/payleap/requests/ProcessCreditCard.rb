class ProcessCreditCard
   def processcreditcardrequest(url,username,password,transtype,cardnum,expdate,magdata,nameoncard,total,ticketnumber,refnum,zip,street,cvnumber,extdata)
    strresponse = ""

    data = 'UserName=' + username + '&Password=' + password +'&TransType=' + transtype + '&CardNum=' + cardnum +'&ExpDate='+ expdate +'&MagData='+ magdata +'&NameOnCard='+ nameoncard +'&Amount='+ total +'&InvNum='+ ticketnumber +'&PNRef='+ refnum +'&Zip='+ zip +'&Street='+ street +'&CVNum='+ cvnumber +'&ExtData='+ extdata
	
    response = HTTParty.get(URI.encode(url+'?'+data))
    data = response.parsed_response
    result = String.new(data['Response']['Result'])
    
    case result
    when '0'
      strresponse += 'Good'+"<br>"
      if(!data['Response']['RespMSG'].nil?)
      if data['Response']['RespMSG'].length > 0
           strresponse = strresponse + "Response: " + data['Response']['RespMSG']+ "<br>"
          end
       end
        if(!data['Response']['AuthCode'].nil?)
        if data['Response']['AuthCode'].length > 0
           strresponse = strresponse + "Approval Code: " + data['Response']['AuthCode']+ "<br>"
          end
       end
        if(!data['Response']['PNRef'].nil?) 
          if data['Response']['PNRef'].length > 0
           strresponse = strresponse + "Reference Number: " + data['Response']['PNRef']+ "<br>"
          end
       end
        if(!data['Response']['GetAVSResult'].nil?)
        if data['Response']['GetAVSResult'].length > 0
           strresponse = strresponse + "AVS Match: " + data['Response']['GetAVSResult']+ "<br>"
          end
       end
      if(!data['Response']['GetCVResult'].nil?)
      if data['Response']['GetCVResult'].length > 0
           strresponse = strresponse + "CV Match: " + data['Response']['GetCVResult'] + "<br>"
          end
       end
    else
      strresponse = 'Bad' + "<br>"
      strresponse = strresponse + 'Error Number:  '+data['Response']['Result'].to_s + "<br>"
      strresponse = strresponse + 'Result: ' + data['Response']['RespMSG'].to_s + "<br>"
      strresponse = strresponse + 'Status:  ' + data['Response']['Message'].to_s + "<br>"
      end


    return strresponse
    end
  end

