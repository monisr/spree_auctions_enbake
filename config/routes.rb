Spree::Core::Engine.routes.draw do
  get "static_translations/index"

  #get "static_pages/index"

  # Add your extension routes here
	Spree::Core::Engine.routes.draw do
    resources :static_translations
  #get "/static_translations"=> "StaticTranslations#index"

  #get "static_pages/index" 

		get "/price" => "home#price"
	  	match "users/:id/send_email" => "users#send_email", :as => "users_send_email"
      match "orders/:id/confirmation" => "orders#confirmation", :as => "orders_confirmation"
      match "orders/complete_order" => "orders#complete_order", :as => "complete_order"
      match "orders/process_order" => "orders#process_order", :as => "process_order"
      match "paypal_payment" => "orders#paypal_payment", :as => "orders_paypal_payment"
      match "payment_options" => "home#payment_options", :as => "home_payment_options"
      match "payment" => "users#payment"
      match "profile" => "users#profile"
      match "auctions" => "users#auctions"
      match "catalog" => "users#catalog"
      get "add_credit_card" => "users#add_credit_card", :as => "add_credit_card"
      get "credit_card_info" => "users#credit_card_info", :as => "credit_card_info"
      get "faq" => "users#faq", :as => "faq"
      resources :bids
     # get '/complete_order' => 'bids#complete_order'

#      get '/static_pages/index', :to => 'Admin/StaticPages#index'
#      get '/static_pages/new', :to => 'Admin/StaticPages#new' 
#      #post '/', :to => 'Admin/StaticPages#create'
      namespace :admin do
        resources :static_pages
        resources :categories
        resources :author_bios
         resources :navigations
        resources :custom_email_contents, except: [:show, :new]
        get '/sort_nav_up' => 'navigations#sort_nav_up'
        get '/sort_nav_down' =>'navigations#sort_nav_down'
        resources :products do
          resources :bids
        end
        get '/pendding_order' =>'products#pendding_order', :as => 'pendding_order'
      end
      
      resources :view_categories
      resources :follows do
        get :follow_product, on: :collection
      end
	end
end
