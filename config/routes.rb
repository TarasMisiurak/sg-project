Rails.application.routes.draw do

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root "pages#home"

  resources :vacancies, :events, :posts

  get "/about", to: "pages#about", as: :about
  get "/portfolio", to: "pages#portfolio", as: :portfolio
  get "/contact", to: "pages#contact", as: :contact
  get "/support", to: "pages#support", as: :support
  get "/gallery", to: "pages#gallery", as: :gallery
  get "/jobs", to: "pages#jobs", as: :jobs
  get "/faq", to: "pages#faq", as: :faq
end