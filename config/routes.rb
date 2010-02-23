ActionController::Routing::Routes.draw do |map|
  map.resources :users, :only => [:new, :create, :show, :edit, :update], :member => {:confirm => :get}
  map.resources :brews, :except => [:new, :edit], :member => {:create_note => :post}, :requirements => {:id => /\d+/}
  map.resources :brewnotes, :only => [:destroy, :edit, :update], :requirements => {:id => /\d+/}
  map.resources :recipes, :requirements => {:id => /\d+/}
  map.resources :styles, :only => [:index]
  map.resources :ingredients, :only => [:index]
  map.resource :user_session
  
  map.login '/login', :controller => :user_sessions, :action => :new
  map.logout '/logout', :controller => :user_sessions, :action => :destroy
  map.signup '/signup', :controller => :users, :action => :new
  map.welcome '/welcome', :controller => :pages, :action => :show, :id => :welcome
  
  map.root :welcome
end
