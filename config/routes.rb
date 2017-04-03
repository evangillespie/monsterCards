Rails.application.routes.draw do
  root to: 'monsters#index'

  get ":page", to: "pages#show"

  resources :monster_sets, only: [:show], path: '' do
    get '/license', to: 'monster_sets#show'
    resources :monsters, only: [:index, :show], path: ''
  end

end
