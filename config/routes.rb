Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#top'

  devise_for :users

  resources :users

  resources :books do
   	collection do
  	get :about
  end
end

end