Rails.application.routes.draw do
  
  # api namespace for controllers
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :users do
      resources :hikes
    end
  end

  post 'auth/login', to: 'authentication#authenticate'

  post 'signup', to: 'users#create'
end
