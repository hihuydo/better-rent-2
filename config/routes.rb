Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects do
    resources :properties do # may need to limit this later
      resources :votes, only: [ :show, :new, :create, :destroy ]
      resources :chatrooms, only: :show do
        resources :messages, only: [ :create, :destroy ]
      end
    end
    resources :participants, only: [ :index, :show, :new, :create, :destroy ]
  end

  # custom route for stage 2
  get '/projects/:id/change_stage', to: 'projects#stage', as: :change_stage
  patch  "projects/:id",      to: "projects#stage"

  # for redis
  mount ActionCable.server => "/cable"
end
