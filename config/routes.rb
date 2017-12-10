Rails.application.routes.draw do
  root to: 'teams#index'
  get '/auth/starladder/callback', to: 'sessions#create'

  resources :teams
  
  controller :tournaments do
    scope :tournaments do
      get '/' => :index
      get '/:id' => :show
    end
  end
end
