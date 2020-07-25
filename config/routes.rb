Rails.application.routes.draw do
  resources :prefectures, only: [:index] do
    resources :cities, only: [:index]
  end
  resources :weather_forecasts, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
