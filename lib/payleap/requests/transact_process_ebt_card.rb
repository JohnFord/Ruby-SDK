#This class processes Payment EBT Card Transactions.
class TransactProcessEBTCard
#this method returns string response
#url - base url of service
#UserName - Your PayLeap API login ID.
#Password - Your PayLeap API transaction key.
#TransType - The transaction type being performed. Always:
#FoodStampSale
#CardNum - The EBT card number used for the transaction.
#ExpDate - The expiration date of the EBT card used for the transaction in MMYY format.
#MagData - The complete raw magnetic stripe data from the card wrapped in single quotes. For example:
#MagData='%B4111111111111111^BO/JAMES B^14041010000000593000000?; 4111111111111111=14041010000059300000?'
#NameOnCard - The cardholder’s name as printed on the card.
#Amount - The dollar amount of the transaction in DDDDDDDDDD.CC format. This amount includes any surcharge.
#InvNum - The invoice number used by the merchant to identify the transaction.
#PNRef - Not used for this transaction type.
#Pin - The encrypted PIN block returned by the PIN pad. The transaction will fail if an unencrypted PIN value is used.
#SureChargeAmt - The amount in DDDD.CC format that a merchant charges for processing a debit card transaction.
#CashBackAmt - Not used for this transaction type.
#RegisterNum - Not used for this transaction type.
#ExtData - An XML string containing additional data for the transaction. See the following section for more information.
  def ProcessEBTCard(url,username,password,transtype,cardnum,expdate,magdata,nameoncard,amount,invnum,pnref,pin,surechargeamt,cashbackamt,registernum,extdata)
    data = 'UserName='+username+'&Password='+password+'&TransType='+transtype+'&CardNum='+cardnum+'&ExpDate='+expdate+'&MagData='+magdata+'&NameOnCard='+nameoncard+'&Amount='+amount+'&InvNum='+invnum+'&PNRef='+pnref+'&Pin='+pin+'&SureChargeAmt='+surechargeamt+'&CashBackAmt='+cashbackamt+'&RegisterNum='+registernum+'&ExtData='+extdata
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
           strresponse = strresponse + "Response: " + data['Response']['RespMSG'].to_s+ ","
          end
       end
     if(!data['Response']['AuthCode'].nil?)  
      if data['Response']['AuthCode'].length > 0 
           strresponse = strresponse + "Approval Code: " + data['Response']['AuthCode'].to_s+ ","
          end
        end
     if(!data['Response']['PNRef'].nil?)   
      if data['Response']['PNRef'].length > 0 
           strresponse = strresponse + "Reference Number: " + data['Response']['PNRef'].to_s+ ","
          end
       end
	  if(!data['Response']['GetAVSResult'].nil?)  
      if data['Response']['GetAVSResult'].length > 0 
           strresponse = strresponse + "AVS Match: " + data['Response']['GetAVSResult'].to_s+ ","
          end
       end
	   if(!data['Response']['GetCVResult'].nil?) 
       if data['Response']['GetCVResult'].length > 0 
           strresponse = strresponse + "CV Match: " + data['Response']['GetCVResult'].to_s+ "."
          end
		end  
      else
      strresponse = 'Bad'+","
      strresponse = strresponse + 'Error Number:  '+data['Response']['Result'].to_s+","
      strresponse = strresponse + 'Result: '+data['Response']['RespMSG'].to_s+","
      strresponse = strresponse + 'Status:  '+data['Response']['Message'].to_s+"."
      end
   return strresponse
    rescue Exception => e
        return e.message
     end
  end
end
