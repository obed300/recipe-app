Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "foods#index"
  # Rails.application.routes.draw do
  get 'welcome/index'
  #   patch 'recipes/:id', to: 'recipes#update', as: 'recipe'

  #   resources :users, only: %i[index show] do
  #     get 'shopping_list', to: 'shopping_lists#index', as: 'users_shopping_list'

  #     resources :foods, only: %i[index show new create destroy]

  #     resources :recipes, only: %i[index show new create destroy] do
  #       resources :foods, only: %i[new create]
  #     end

  # root 'pages#hello'
  # get '/greeting', to: 'custom_pages#hello'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'
  resources :users, only: %i[index show] do
    resources :foods, only: %i[index show new create destroy]
    resources :recipes, only: %i[index show new create destroy] do
      resources :recipes_foods, only: %i[index show new create destroy]
    end
  end
end
