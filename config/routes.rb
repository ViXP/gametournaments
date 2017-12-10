Rails.application.routes.draw do
  root to: 'teams#index'
  
  get '/auth/starladder/callback', to: 'sessions#create'
  get 'logout' => 'sessions#destroy', as: :logout
  get '/auth/starladder', as: :login

  resources :teams
  
  controller :tournaments do
    scope :tournaments do
      get '/' => :index, as: :tournaments
      get '/:id' => :show, as: :tournament
    end
  end
end
