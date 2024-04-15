Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "/links", to: "links#index"
  post "/links", to: "links#create"
  get "/links/:short_code", to: "links#show_details"
  get "/links/:short_code/edit", to: "links#edit", as: "edit_link"
  patch "/links/:short_code", to: "links#update"
  delete "/links/:short_code", to: "links#destroy", as: "link"
  get "/:short_code", to: "links#show"

  root "links#index"
end
