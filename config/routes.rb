Rails.application.routes.draw do
  resources :venues

  root to: 'venues#index'
end
