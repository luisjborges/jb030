Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get "about", to: "pages#about"
  get "faq", to: "pages#faq"
  get "imprint", to: "pages#imprint"
  get "agb", to: "pages#agb"
  get "admin", to: "pages#admin"

  resources :subscribers, only: [:new, :create, :index]

  resources :products do
    collection do
      get :shirt, :voucher
    end
  end

  resources :orders, only: [:show, :new, :create] do
    resources :payments, only: [:new]
  end

  resources :orders, only: [:show, :new, :create] do
    resources :deliveries, only: [:new, :create, :show]
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'

end
