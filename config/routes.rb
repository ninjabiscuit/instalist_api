InstalistApi::Application.routes.draw do
  resources :lists
  resources :items
  root 'lists#index'
end
