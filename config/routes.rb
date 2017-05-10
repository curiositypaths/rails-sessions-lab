Rails.application.routes.draw do
  root to: 'public#index'
  get '/private', to: 'private#index'
end
