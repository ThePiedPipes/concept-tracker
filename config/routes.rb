ActionController::Routing::Routes.draw do |map|
  map.resources :suggestions
  map.resources :users
  map.resource :session
  map.resources :concepts
  
  map.admin 'admin', :controller => 'admin', :action => 'dashboard'
  map.admin_users 'admin/users', :controller => 'admin', :action => 'users'
  map.admin_reports 'admin/reports', :controller => 'admin', :action => 'reports'
  
  
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'


  # Install the default routes as the lowest priority.
  map.root :controller => 'concepts', :action => 'index'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
