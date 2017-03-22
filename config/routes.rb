Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#new"

  get '/users/admo_org_chart' => 'users#org_charts'
  get '/users/bpf_org_chart' => 'users#org_charts'
  get '/users/hr_org_chart' => 'users#org_charts'
  get '/users/smf_org_chart' => 'users#org_charts'

  resources :users, only: [:new, :create, :show, :edit, :update, :index]

  get '/pages/*page' => 'pages#show'

  get 'login' => 'sessions#new', as: :login
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy', as: :logout
end
