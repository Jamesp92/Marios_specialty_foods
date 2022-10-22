Rails.application.routes.draw do
  root to: 'reviews#index'

  resources :products do 
    resources :reviews 
  end
end
