Rails.application.routes.draw do
  resources :users do
    resources :hikes
  end

  post 'auth/login', to: 'authentication#authenticate'
end
