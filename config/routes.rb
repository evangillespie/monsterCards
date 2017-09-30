Rails.application.routes.draw do
  root to: 'monsters#index'

  get "favourites", to: "favourites#index"
  get "favourites/fetch", to: "favourites#fetch"

  resources :monster_sets, only: [:show], path: '' do
    get '/license', to: 'monster_sets#show'
    resources :monsters, only: [:index, :show], path: ''
  end

  get ":page", to: "pages#show"

  get '*unmatched_route', to: 'application#not_found'

end
