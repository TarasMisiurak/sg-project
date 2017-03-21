Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root "pages#home"

  get "/about", to: "pages#about", as: :about
  get "/portfolio", to: "pages#portfolio", as: :portfolio
  get "/contact", to: "pages#contact", as: :contact
  get "/support", to: "pages#support", as: :support
  get "/gallery", to: "pages#gallery", as: :gallery
  get "/vacancies", to: "pages#vacancies", as: :vacancies
  get "/events", to: "pages#events", as: :events
  get "/faq", to: "pages#faq", as: :faq
end
