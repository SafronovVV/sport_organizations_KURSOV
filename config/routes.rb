Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sports, only: %i[index new create]
  resources :sport_complexes, only: %i[index new create]
  resources :sport_organizations, only: %i[index new create]
  resources :clubs, only: %i[index new create]
  resources :competitions, only: %i[index new create]
  resources :participants, only: %i[index new create]
  resources :requests, only: %i[index new create]
  resources :results, only: %i[index new create]

  get 'participants_list_download' => 'participants#download_list', format: 'docx'
  get 'requests_list_download' => 'requests#download_list', format: 'docx'
  get 'results_report_download' => 'results#download_list', format: 'docx'
  root 'sports#index'
end
