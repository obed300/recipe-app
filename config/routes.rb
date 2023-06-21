Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'pages#hello'
  get '/greeting', to: 'custom_pages#hello'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  Rails.application.routes.draw do
    resources :users, only: %i[index show] do
      get 'shopping_list', to: 'shopping_lists#index', as: 'users_shopping_list'
      resources :foods, only: %i[index show new create]
      resources :recipes, only: %i[index show new create destroy] do
        resources :foods, only: %i[new create]
      end
    end
  end
  
end
