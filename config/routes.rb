Rails.application.routes.draw do


  get 'contacts/new'

  get 'contacts/create'

  get 'set_language/english'

  get 'set_language/ukrainian'

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root "pages#home"

  resources :vacancies, :events
  resources :posts, path: 'news'
  resources :contacts, only: [:new, :create], path: 'contact'

  get "/about", to: "pages#about", as: :about
  get "/portfolio", to: "pages#portfolio", as: :portfolio
  get "/support", to: "pages#support", as: :support
  get "/gallery", to: "pages#gallery", as: :gallery
  get "/jobs", to: "pages#jobs", as: :jobs
  get "/faq", to: "pages#faq", as: :faq
  get "/contact", to: "contacts#new", as: :contact
end