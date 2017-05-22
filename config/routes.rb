Rails.application.routes.draw do
  resources :movies do
    resources :reviews, except: [:show]
  end

  get 'about' => 'mainpage#about'

  get 'show' => 'reviews#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mainpage#index'

  get 'index' => 'mainpage#index'
end
