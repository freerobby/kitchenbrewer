ActionController::Routing::Routes.draw do |map|
  map.resources :users, :only => [:new, :create, :show, :edit, :update]
  map.resource :user_session
  
  map.login '/login', :controller => :user_sessions, :action => :new
  map.logout '/logout', :controller => :user_sessions, :action => :destroy
  map.signup '/signup', :controller => :users, :action => :new
  
  map.root :signup
end
