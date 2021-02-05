Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get '/api/test', to: 'api#test'
  get '/api/cep', to: 'api#zipcode'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
