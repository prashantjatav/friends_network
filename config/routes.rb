Friendsnetwork::Application.routes.draw do

  get "users/search"
  
  

  devise_for :users, :controllers => { :registrations => "registrations"}


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  resources :users do
    resources :profiles
    resources :friends
  end
  
  resources :posts do
   member do
    
   end
   collection do
     post 'add_comment'
     post 'add_like'
   end
   resources :comments
   resources :likes
  end 
  resources :friendlists do
    collection do
      get 'search_user'
      post 'add_friend'
      get 'check'
    end
    member do
      
    end
  end
  resources :homes
  resources :photos
  # Sample resource route with options:
  #   resources :user do
  #     member do
  #       get 'login'
  #     end
  #
  #     collection do
  #       
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
   root :to => 'homes#index'
  
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
