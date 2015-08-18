Rails.application.routes.draw do
  delete "/sign_out", to: "sessions#destroy"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/auth/failure", to: "sessions#fail"

  get "about", to: "static_pages#about"
  get "contact", to: "static_pages#contact"
  get "support", to: "static_pages#support"

  resources :manufacturers do
    post :sort, on: :collection
  end

  root to: "manufacturers#index"
end
