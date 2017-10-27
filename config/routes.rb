Rails.application.routes.draw do

  root 'articles#index'

  resources :articles, only: [:index, :show, :new, :create, :edit, :update, :destroy]

end
