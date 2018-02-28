Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  [:sports, :sport_complexes, :sport_organizations, :clubs, :competitions, :results].each do |action|
    resources action, only: %i[index new create]
  end

  [:participants, :requests].each do |action|
    resources action, only: %i[index new create edit update]
  end

  get 'participants_list_download' => 'participants#download_list', format: 'docx'
  get 'requests_list_download' => 'requests#download_list', format: 'docx'
  get 'results_report_download' => 'results#download_list', format: 'docx'
  root 'sports#index'
end
