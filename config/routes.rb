PayLeapSDK::Application.routes.draw do
  get "getchecktrxsummaryresponse/_getchecktrxsummaryresponse"

  get "getcardtrxsummaryresponse/_getcardtrxsummaryresponse"

  get "getcardtrxresponse/_getcardtrxresponse"

  get "getinforesponse/_getinforesponse"
  get "reportresponse/_reportresponse"
  get "reportresponce/reportresponse"
  get "getopenbatchsummary/getopenbatchsummary"
  get "getinfo/getinfo"
  get "getchecktrx/getchecktrx"
  get "getcardtrxsummary/getcardtrxsummary"
  get "getcardtrx/getcardtrx"
  get "managecustomer/managecustomer"
  get "managecontract/managecontract"
  get "managecreditinfo/managecreditinfo"
  get "managecheckinfo/managecheckinfo"
  get "processcheckrecurringbilling/processcheckrecurringbilling"
  get "processcreditcardrecurringbilling/processcreditcardrecurringbilling"
  get "addrecurringcheck/addrecurringcheck"
  get "urlmerchantcombo/_urlmerchantcombo"
  get "urlcombo/_urlcombo"
  get "recurringcreditcard/recurringreditcard"
  get "webserviceresponse/_webserviceresponse"
  get "footer/_footer"
  get "customtokensample/customtokensample"
  get "transactvalidmod10/transactvalidmod10"
  get "transactvalidexpdate/transactvalidexpdate"
  get "transactvalidcardlength/transactvalidcardlength"
  get "transactvalidcard/transactvalidcard"
  get "transactprocessgiftcard/transactprocessgiftcard"
  get "transactprocessebtcard/transactprocessebtcard"
  get "transactprocesscheck/transactprocesscheck"
  get "transactdebitcard/transactprocessdebitcard"
  get "welcome/index"
  get "header/header"
  get "posts/new"
  post "posts" => "posts#create"
  post "welcome" => "welcome#create"
  get "welcome" => "welcome#show"
  get "posts/:id" => "posts#show"
  get "posts" => "posts#index"
  post "transactdebitcard" => "transactdebitcard#processdebitcard"
  post "transactprocesscheck" => "transactprocesscheck#transactprocesscheckrequest"
  post "transactprocessebtcard" => "transactprocessebtcard#transactprocessebtcardrequest"
  post "transactprocessgiftcard" => "transactprocessgiftcard#transactprocessgiftcardrequest"
  post "transactvalidcard" => "transactvalidcard#transactvalidcardrequest"
  post "transactvalidcardlength" => "transactvalidcardlength#transactvalidcardlengthrequest"
  post "transactvalidexpdate" => "transactvalidexpdate#transactvalidexpdaterequest"
  post "transactvalidmod10" => "transactvalidmod10#transactvalidmod10request"
  post "customtokensample" => "customtokensample#customtokensamplerequest"
  post "recurringcreditcard" => "recurringcreditcard#recurringreditcardrequest"
  post "addrecurringcheck" => "addrecurringcheck#addrecurringcheckrequest"
  post "processcreditcardrecurringbilling" => "processcreditcardrecurringbilling#processcreditcardrecurringbillingrequest"
  post "processcheckrecurringbilling" => "processcheckrecurringbilling#processcheckrecurringbillingrequest"
  post "managecreditinfo" => "managecreditinfo#managecreditinforequest"
  post "managecheckinfo" => "managecheckinfo#managecheckinforequest"
  post "managecontract" => "managecontract#managecontractrequest"
  post "managecustomer" => "managecustomer#managecustomerrequest"
  post "getcardtrx" => "getcardtrx#getcardtrxrequest"
  post "getcardtrxsummary" => "getcardtrxsummary#getcardtrxsummaryrequest"
  post "getchecktrx" => "getchecktrx#getchecktrxrequest"
  post "getinfo" => "getinfo#getinforequest"
  post "getopenbatchsummary" => "getopenbatchsummary#getopenbatchsummaryrequest"
  get "transactprocessebtcard" => "transactprocessebtcard#transactprocessebtcard"
  get "transactdebitcard" => "transactdebitcard#transactprocessdebitcard"
  get "transactprocesscheck" => "transactprocesscheck#transactprocesscheck"
  get "transactprocessgiftcard" => "transactprocessgiftcard#transactprocessgiftcard"
  get "transactvalidcard" => "transactvalidcard#transactvalidcard"
  get "transactvalidcardlength" => "transactvalidcardlength#transactvalidcardlength"
  get "transactvalidexpdate" => "transactvalidexpdate#transactvalidexpdate"
  get "transactvalidmod10" => "transactvalidmod10#transactvalidmod10"
  get "customtokensample" => "customtokensample#customtokensample"
  get "recurringcreditcard" => "recurringcreditcard#recurringreditcard"
  get "addrecurringcheck" => "addrecurringcheck#addrecurringcheck"
  get "processcreditcardrecurringbilling" => "processcreditcardrecurringbilling#processcreditcardrecurringbilling"
  get "processcheckrecurringbilling" => "processcheckrecurringbilling#processcheckrecurringbilling" 
  get "managecheckinfo" => "managecheckinfo#managecheckinfo"
  get "managecreditinfo" => "managecreditinfo#managecreditinfo"
  get "managecontract" => "managecontract#managecontract"
  get "managecustomer" => "managecustomer#managecustomer"
  get "getcardtrx" => "getcardtrx#getcardtrx"
  get "getcardtrxsummary" => "getcardtrxsummary#getcardtrxsummary"
  get "getchecktrx" => "getchecktrx#getchecktrx"
  get "getinfo" => "getinfo#getinfo"
  get "getopenbatchsummary" => "getopenbatchsummary#getopenbatchsummary"
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'welcome#index'
     
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
