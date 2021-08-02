Rails.application.routes.draw do
  devise_for :users


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => "tops#index"
  resources :lists do
    resources :cards, only: %i(new create show update destroy)
  end

  post 'guest_login', to: "guest_sessions#create"
end
