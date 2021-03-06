Hanjay::Application.routes.draw do

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  
  # match ':controller(/:action(/:id))(.:format)'

  
  resources :news, :only => [:index, :show]
 
  match "/admin/createAdmin" => "admin#createAdmin", :via => :post
  match '/admin/showAdmins' => 'admin#showAdmins' 
  match '/admin/deleteAdmin/:id' => 'admin#deleteAdmin' , :via => :delete
  
  match "/admin/loginCheck" => "admin#loginCheck", :via => :post
  match "/admin/update" => "admin#update", :via => :put
  match '/admin' => 'admin/news#index'    
  
  namespace :admin do
    get "sign_up", "log_in", "log_out", "edit"
    

    resources :events
    resources :flaws

    resources :news, :except => :new do
      match 'uploadPhoto' => 'news#createPhoto', :via => [:post]
      match 'deletePhoto/:id' => 'news#destroyPhoto', :via => [:delete]
    end
    
  end

  resources :flaws
  resources :events
  
  match "pages/:id"		=> "static_page#show"
  resources :pages, :only => :show
  
  resources :news, :only => [:index, :show]
  
  root :to => "static_page#index"
  
  
end
