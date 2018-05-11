Rails.application.routes.draw do
  devise_for :admins
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :students
resources :intructors
resources :cohorts
resources :courses
end
