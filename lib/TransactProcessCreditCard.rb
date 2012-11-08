require 'rubygems'
require 'httparty'
#This class Processes Payment Credit Card Transaction.
class TransactProcessCreditCard
#this method returns string response
#URL - Base Url of service
#UserName - Your PayLeap API login ID.
#Password - Your PayLeap API transaction key.
#TransType - The transaction type being performed. Always: Sale
#CardNum - The credit card number used for the transaction.
#ExpDate - The expiration date of the credit card used for the transaction in MMYY format.
#MagData - For swiped transactions, the complete raw magnetic stripe data from the card wrapped in single quotes. For example:
#MagData='%B4111111111111111^BO/JAMES B^14041010000000593000000?; 4111111111111111=14041010000059300000?'
#NameOnCard - The cardholder’s name as printed on the card.
#Amount - The dollar amount of the transaction in DDDDDDDDDD.CC format. This amount includes any tax or tip amounts specified in ExtData.
#InvNum - The invoice number used by the merchant to identify the transaction.
#PNRef - Not used for this transaction type.
#Zip - The cardholder’s billing ZIP code. Used for AVS.
#Street - The cardholder’s street address. Used for AVS.
#CVNum - The 3-4 digit card verification number. For American Express, four digits displayed on the front of the card; for other card types, usually three digits displayed on the back of the card.
#ExtData - An XML string containing additional data for the transaction. See the following section for more information.
   def ProcessCreditCard(url,username,password,transtype,cardnum,expdate,magdata,nameoncard,total,ticketnumber,refnum,zip,street,cvnumber,extdata)
    strresponse = ""

    data = 'UserName=' + username + '&Password=' + password +'&TransType=' + transtype + '&CardNum=' + cardnum +'&ExpDate='+ expdate +'&MagData='+ magdata +'&NameOnCard='+ nameoncard +'&Amount='+ total +'&InvNum='+ ticketnumber +'&PNRef='+ refnum +'&Zip='+ zip +'&Street='+ street +'&CVNum='+ cvnumber +'&ExtData='+ extdata
	begin
    response = HTTParty.get(URI.encode(url+'?'+data))
    data = response.parsed_response
    result = String.new(data['Response']['Result'])
    
    case result
    when '0'
      strresponse += 'Good'+","
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
           strresponse = strresponse + "CV Match: " + data['Response']['GetCVResult'] + ","
          end
       end
    else
      strresponse = 'Bad' + ","
      strresponse = strresponse + 'Error Number:  '+data['Response']['Result'].to_s + ","
      strresponse = strresponse + 'Result: ' + data['Response']['RespMSG'].to_s + ","
      strresponse = strresponse + 'Status:  ' + data['Response']['Message'].to_s + "."
      end
     return strresponse
  rescue Exception => e
        return e.message
    end
   end
  end

