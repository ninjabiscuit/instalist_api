InstalistApi::Application.routes.draw do
  resources :users

  resources :lists, except: [:new, :edit] do
    resources :items, except: [:new, :edit]
  end
  root 'lists#index'
end
