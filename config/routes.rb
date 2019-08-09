Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'signup', to: 'users#create' 
      resources :users do
        resources :hikes
      end 
    end 
  end 

  # namespace :api do
  #   namespace :v2 do
  #     resources :users 
  #   end 
  # end 

  post 'auth/login', to: 'authentication#authenticate'
end