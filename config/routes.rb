Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'

  get '/pages/*page' => 'pages#show'

  get '/users/org_charts' => 'users#org_charts'
  get '/users/admo_org_chart' => 'users#admo_org_chart'
  get '/users/bpf_org_chart' => 'users#bpf_org_chart'
  get '/users/hr_org_chart' => 'users#hr_org_chart'
  get '/users/smf_org_chart' => 'users#smf_org_chart'
  get '/users/opps' => 'users#opps'
  get '/badges/exp' => 'badges#exp'

  resources :users, only: [:new, :create, :show, :update, :edit, :index]
  resources :opportunities, only: [:show]

  resources :users do
    resources :badges, only: [:new, :create, :show, :update, :edit, :destroy]
    resources :recognitions, only: [:new, :create, :show, :update, :edit, :destroy]
  end

  resources :opportunities do
    resources :badges, only: [:new, :create]
  end

  resources :badges, :recognitions, :opportunities do
    member do
      put 'like'
      put 'unlike'
    end
  end

  get 'login' => 'sessions#new', as: :login
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy', as: :logout
end
