Rails.application.routes.draw do
  # Devise routes for user sessions and registrations
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Root path route
  root 'welcome#index'

  # Welcome controller route
  get 'welcome/index'

  # User routes
  resources :users, only: %i[index show] do
    # Food routes
    resources :foods, only: %i[index show new create destroy] do
      # Recipe routes
      resources :recipes, only: %i[index show new create destroy]
      # RecipesFoods routes
      resources :recipes_foods, only: %i[index show new create destroy]
    end
  end
end
