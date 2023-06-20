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
  resources :users, only: %i[index show] do
    resources :foods, only: %i[index show new create] do
      resources :recipes, only: %i[index show new create] do
        resources :recipes_food, only: %i[index show new create]
      end
    end
  end
end
