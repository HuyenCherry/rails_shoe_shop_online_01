Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/admin", to: "admin#index"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/detail", to: "static_pages#detail"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "search", to: "search#index"
    resources :users
    resources :account_activations, only: :edit
    resources :password_resets, only: [:new, :create, :edit, :update]
    resources :shoes, only: [:index, :show]
    resources :categories, only: [:index, :show]
    resources :carts
    resources :cart_items
    resources :orders
    resources :bills
    resources :order_items
    namespace :admin do
      resources :users
      resources :categories
      resources :shoes
      get "/login", to: "sessions#new"
      post "/login", to: "sessions#create"
      delete "/logout", to: "sessions#destroy"
    end
  end
end
