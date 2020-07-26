Rails.application.routes.draw do
  root 'prefectures#index'
  resources :prefectures, only: [:index], shallow: true do
    resources :cities, only: [:index] do
      resources :weather_forecasts, only: [:index]
    end
  end
end
