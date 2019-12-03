Rails.application.routes.draw do
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  get '/artists/', to: 'pages#artists'
  get '/artists/:id', to: 'pages#artist_home', as: :artist
  get '/artists/:id/about', to: 'pages#artist_about', as: :artist_about
  resources :artworks do
    resources :comments, only: [:create]
  end
  resources :orders, only: [:index, :show, :create] do
    resources :payments, only: :new
  end

  resources :events, only: [:index, :create_like, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
