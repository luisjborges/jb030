Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get "about", to: "pages#about"
  get "faq", to: "pages#faq"
  get "imprint", to: "pages#imprint"

  resources :subscribers, only: [:new, :create, :index]

  resources :vouchers

  resources :products

  resources :products do
    collection do
      get :coupon
    end
  end

  resources :products do
    collection do
      get :shirt
    end
  end

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'

end
