Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#top'

  devise_for :users


  resources :users
    get '/home/about' => 'users#about'

  resources :books

end