Rails.application.routes.draw do
  root to: 'monsters#index'
  resources :monsters, only: [:index, :show]

  get "/pages/:page" => "pages#show"
end
