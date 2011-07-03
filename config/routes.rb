ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users

  map.resource :session

  map.resources :galeries
  map.resources :homes

  map.root :controller => "homes"
  map.upload 'upload/create', :controller => 'upload', :action => 'create'
  map.showing_image 'showing_image/:klass/:id/:type_image', :controller => "downloads", :action=> "showing_image"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
