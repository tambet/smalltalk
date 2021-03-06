Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get 'me'        => 'users#show'
      post 'signup'   => 'users#create'
      post 'login'    => 'sessions#create'
      delete 'logout' => 'sessions#destroy'

      get 'signup'    => 'users#create'
      get 'login'     => 'sessions#create'
      get 'logout'    => 'sessions#destroy'

      resources :posts
    end
  end
  get '*path', to: 'home#index'
end
