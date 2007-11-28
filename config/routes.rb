ActionController::Routing::Routes.draw do |map|
  map.resources :domains do |domain|
    domain.resources :accounts, :forwardings
  end
  map.resources :accounts, :forwardings
  
  map.resources :users
  map.resource :session
  map.root :controller => 'domains'
end
