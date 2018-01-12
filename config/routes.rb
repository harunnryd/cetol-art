Rails.application.routes.draw do
  resources :courses, except: :index
  root 'courses#index'
end
