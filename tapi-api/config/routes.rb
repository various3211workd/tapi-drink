Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    post 'user/new' , to: 'users#create'
    post 'auth/login' , to: 'users#login'
    delete 'user/delete', to: 'users#delete_user'
    get  'shops/show' , to: 'shops#show'
    post 'shops/create' , to: 'shops#create'
  end
end