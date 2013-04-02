#This service operation allows you to add, update, and delete customer information.
class MerchantManageCustomer
  # TransType - The transaction type being performed. Valid values are: [Add Update Delete]
  # :w
  #

  def ManageCustomer(options={})
    customer = options[:customer]
    data = { :TransType => options[:transType],
             :CustomerKey => customer.customerKey,
             :CustomerID => customer.customerID,
             :CustomerName => customer.customerName,
             :FirstName => customer.firstName,
             :LastName => customer.lastName,
             :Title => customer.title,
             :Department => customer.department,
             :Street1 => customer.street1,
             :Street2 => customer.street2,
             :Street3 => customer.street3,
             :City => customer.city,
             :StateID => customer.stateID,
             :Province => customer.province,
             :Zip => customer.zip,
             :CountryID => customer.countryID,
             :DayPhone => customer.dayPhone,
             :NightPhone => customer.nightPhone,
             :Fax => customer.fax,
             :Email => customer.email,
             :Mobile => customer.mobile,
             :Status => customer.status
    }

    response = payleap_get(:call => 'TODO', :params => data )
    if(response['RecurringResult']['Code'] == "Ok")
      key = data['RecurringResult']['CustomerKey']
      {:customer_key => key}
    else
      nil
    end
  end
end
