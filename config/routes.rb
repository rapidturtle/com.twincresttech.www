Rails.application.routes.draw do
  delete "/sign_out", to: "sessions#destroy"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/auth/failure", to: redirect("/")

  get "about", to: "static_pages#about", as: :about
  get "contact", to: "static_pages#contact", as: :contact

  resources :manufacturers

  root to: "manufacturers#index"
end
