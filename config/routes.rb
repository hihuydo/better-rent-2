Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects
  
  resources :properties do # may need to limit this later
    resources :votes, only: [ :index, :new, :create]
  end
end
