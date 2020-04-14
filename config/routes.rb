Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get "about", to: "pages#about"
  get "faq", to: "pages#faq"
  get "imprint", to: "pages#imprint"

  resources :subscribers, only: [:new, :create, :index]

  resources :products do
    collection do
      get :top
    end
  resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [ :destroy ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
end

end
