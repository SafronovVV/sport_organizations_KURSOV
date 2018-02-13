Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sports, only: %i[index new create]
  resources :sport_complexes, only: %i[index new create]
  root 'sports#index'
end
