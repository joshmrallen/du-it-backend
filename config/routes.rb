Rails.application.routes.draw do

  post '/add_word', to: 'users#add_word'
  delete '/remove_word', to: 'word_lists#destroy'

  get '/words/:id/voice/female', to: 'words#female_voice'
  get '/words/:id/voice/male', to: 'words#male_voice'

  resources :books, only: [:create, :index, :show]
  resources :word_lists
  resources :words
  resources :users
end



















# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html