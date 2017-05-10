Rails.application.routes.draw do
  root to: 'public#index'
  get '/private', to: 'private#index'#, as: 'private_path'
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
end
