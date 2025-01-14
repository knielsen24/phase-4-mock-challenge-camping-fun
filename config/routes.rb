Rails.application.routes.draw do
  resources :campers, except: [:update, :destroy]
  resources :signups, only: :create
  resources :activities, only: [:index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
