Rails.application.routes.draw do
  resources :books, only: [:create, :index, :show]
  resources :word_lists
  resources :words
  resources :users
end



















# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html