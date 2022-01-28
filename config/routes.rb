Rails.application.routes.draw do
  resources :reviews
  post "/collect_reviews", to: "reviews#collect_reviews"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
