%w( ManageContract MerchantAddRecurringCheck MerchantAddRecurringCreditCard MerchantManageCheckInfo MerchantManageContract MerchantManageCreditCardInfo MerchantManageCustomer MerchantProcessCheckRecurringBilling MerchantProcessCreditCardRecurringBilling ProcessCreditCard ReportGetCardTrx ReportGetCardTrxSummary ReportGetCheckTrx ReportGetInfo ReportGetOpenBatchSummary TransactProcessCheck TransactProcessCreditCard TransactProcessDebitCard TransactProcessEBTCard TransactProcessGiftCard TransactSampleToken TransactValidCard TransactValidCardLength TransactValidExpDate TransactValidMod10
  ).each do |lib|
  require File.join(File.dirname(__FILE__), 'requests', lib)
end
