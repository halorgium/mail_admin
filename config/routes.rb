ActionController::Routing::Routes.draw do |map|
  map.resources :domains
  map.resource :session
  map.root :controller => 'domains'
end
