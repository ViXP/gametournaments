Rails.application.routes.draw do
  get 'captain_info/show'

  root to: 'teams#index'
  
  get '/auth/starladder/callback', to: 'sessions#create'
  get 'logout' => 'sessions#destroy', as: :logout
  get '/auth/starladder', as: :login

  resources :teams
  
  scope :tournaments do
    controller :tournaments do
      get '/' => :index, as: :tournaments
      get '/:id' => :show, as: :tournament
    end
    controller :participations do
      post '/:id' => :participate, as: :participate
      delete '/:id' => :stop_participation, as: :dont_participate
    end
  end
end
