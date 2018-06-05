Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :admins
  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :students
resources :instructors
resources :cohorts
resources :courses
end
