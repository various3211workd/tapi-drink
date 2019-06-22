Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    post 'signup' , to: 'users#create'
    post 'auth/login' , to: 'users#login'
  end
end