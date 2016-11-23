Rails.application.routes.draw do

  get 'evaluations/index'

  resource :sessions, only: [:new, :create, :destroy]

  get "signin", to: "session#new", as: "signin"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
