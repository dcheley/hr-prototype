Rails.application.routes.draw do
  root 'sessions#new'

  post '/rate' => 'rater#create', :as => 'rate'

  get '/pages/*page' => 'pages#show'

  get '/users/home'
  get '/users/org_charts'
  get '/users/admo_org_chart'
  get '/users/bpf_org_chart'
  get '/users/hr_org_chart'
  get '/users/smf_org_chart'
  get '/badges/exp'

  get 'signups/step_one'
  get 'signups/step_two'
  get 'signups/step_three'
  get 'signups/step_four'
  get 'signups/step_five'
  get 'signups/step_six'

  resources :signups, only: [:new, :create, :update]
  resources :users, only: [:new, :create, :show, :update, :edit, :index]
  resources :opportunities
  resources :pulse_surveys, only: [:edit, :update]

  resources :users do
    resources :badges, only: [:new, :create, :update, :edit, :destroy]
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
