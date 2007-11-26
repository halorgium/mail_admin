ActionController::Routing::Routes.draw do |map|
  map.resources :domains, :users
  map.resource :session
  map.root :controller => 'domains'
end
