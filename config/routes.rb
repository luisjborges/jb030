Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get "about", to: "pages#about"
  get "faq", to: "pages#faq"

  resources :products do
    collection do
      get :top
    end
  resources :reviews, only: [:new, :create]

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
