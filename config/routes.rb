Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self) rescue ActiveAdmin::DatabaseHitDuringLoad
    # Шляхи до реєстрації та сесії клієнта
    devise_for :clients, controllers: {
      sessions: 'clients/sessions',
      registrations: 'clients/registrations'
    }

    resources :genres
    resources :book_authors
    resources :book_genres
    resources :books
    resources :publishers
    resources :authors
    resources :returns
    resources :borrowed_books
      resources :book_reviews
        resources :library_cards, only: [:create, :update]

    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
    get "up" => "rails/health#show", as: :rails_health_check
    # Defines the root path route ("/")
    root "home#index"

    namespace :clients do
      resource :profile, only: [:show, :edit, :update], controller: 'profiles'
    end
  end
end
