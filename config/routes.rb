Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { registrations: "registrations" }
  resources :users

  root "home#landing_page"

  get "home/index"

  get "home/landing_page"

  get "home/project"

  get "home/about"

  get "home/contact"

  get 'payments/create'

  post "home/thank_you"

  post 'payments/create'

  resources :orders, only: [:index, :show, :create, :destroy]
  resources :order_items, only: [:index, :show, :create, :destroy]
  resources :products do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'
end
