Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout", sign_up: "signup"}
  resources :courses
  resources :episodes
end
