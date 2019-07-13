# frozen_string_literal: true

Rails.application.routes.draw do

  resources :products, except: %i[new edit]
  # RESTful routes
  resources :examples, except: %i[new edit]

  # Custom routes
  get '/users' => 'users#index'
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'

  # Custom routes
  get '/customers' => 'customers#index'
  post '/customer-sign-up' => 'customers#signup'
  post '/customer-sign-in' => 'customers#signin'
  delete '/customer-sign-out' => 'customers#signout'
  patch '/customer-change-password' => 'customers#changepw'
end
