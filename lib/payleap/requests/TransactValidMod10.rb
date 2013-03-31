module Payleap
  module TransactValidMod10
    def ValidMod10(cardnumber)
      data = {:CardNumber => cardnumber}
      response = payleap_get(:call => 'validMod10', :params => data)
      response["boolean"] == 'true'
    end
  end
end
