module Payleap
  module TransactValidMod10
    def ValidMod10(options={})
      return false unless options[:cardnumber]
      data = {:CardNumber => options[:cardnumber]}
      response = payleap_get(:call => 'validMod10', :params => data)
      response["boolean"] == 'true'
    end
  end
end
