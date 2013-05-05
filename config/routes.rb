InstalistApi::Application.routes.draw do
  resources :lists do
    resources :items
  end
  root 'lists#index'
end
