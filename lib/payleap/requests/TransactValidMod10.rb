module Payleap
  module TransactValidMod10
    def ValidMod10(cardnumber)
      data = {:CardNumber => cardnumber}
      response = Payleap::Request.get(:params => data)
      response["boolean"]["__content__"] == 'true'
    end
  end
end
