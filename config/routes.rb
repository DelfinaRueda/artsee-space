Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  get '/artists/', to: 'pages#artists'
  get '/artists/:id', to: 'pages#artist', as: :artist
  resources :artworks do
    resources :comments, only: [:create]
  end
  resources :orders, only: [:index, :show, :create] do
    resources :payments, only: :new
  end
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
