Rails.application.routes.draw do
  root to: 'monsters#index'

  get "favourites", to: "favourites#index"
  get "favourites/fetch", to: "favourites#fetch"

  get 'kickstarter', to: redirect('https://www.kickstarter.com/projects/cawlin/monster-cards-dnd-5e-reference-cards-for-creature-stats')

  get ":page", to: "pages#show"

  resources :monster_sets, only: [:show], path: '' do
    get '/license', to: 'monster_sets#show'
    resources :monsters, only: [:index, :show], path: ''
  end

  get '*unmatched_route', to: 'application#not_found'

end
