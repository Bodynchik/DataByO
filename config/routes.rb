Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    # Шляхи до реєстрації та сесії клієнта
    devise_for :clients, controllers: {
      sessions: 'clients/sessions',
      registrations: 'clients/registrations'
    }
    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
    get "up" => "rails/health#show", as: :rails_health_check
    # Defines the root path route ("/")
    root "home#index"
  end
end
