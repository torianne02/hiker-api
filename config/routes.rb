Rails.application.routes.draw do
  resources :users do
    resources :hikes
  end
end
