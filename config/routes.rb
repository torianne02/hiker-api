Rails.application.routes.draw do
  # api namespace for controllers
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :users do
      resources :hikes
    end
  end

  scope module: :v2, constraints: ApiVersion.new('v2') do 
    resources :users, only: :index
  end 

  post 'auth/login', to: 'authentication#authenticate'

  post 'signup', to: 'users#create'
end
