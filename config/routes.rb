ActionController::Routing::Routes.draw do |map|


  map.search '/events/add_reply', :controller => 'events', :action => 'add_reply'

#  map.search '/users/search', :controller => 'users', :action => 'search', :conditions => {:method => :get}
#  map.add_friend '/users/add_friend', :controller => 'users', :action => 'add_friend'

  map.login "login", :controller => "user_sessions", :action => "new", :conditions => {:method => :get}
  map.login "login", :controller => "user_sessions", :action => "create", :conditions => {:method => :post}
  map.logout "logout", :controller => "user_sessions", :action => "destroy"

  # You should use the below line instead of the above line.
  #map.logout "logout", :controller => "sessions", :action => "destroy", :conditions => {:method => :delete}
  
  #map.resources :replies, :except => [:index, :delete, :new, :create]
  map.resources :events, :except => [:index, :delete]
  
  map.resources :events do |events|
    events.resources :replies, :only => [:create, :update, :show, :edit]
  end
    

  map.resources :invitations, :except => [:update]
  map.resources :histories, :only => [:index]
  map.resources :about_us, :only => [:index]
  map.resources :contact_us, :only => [:index]
  map.resources :add_friend, :only => [:update]
  map.resources :search_friend, :only => [:new, :index]

  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)
  
  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  map.resources :users, :has_many => [:events, :replies, :invitations]
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
 # map.root :controller => "users"
  map.root :controller => "user_sessions", :action => "new"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end
