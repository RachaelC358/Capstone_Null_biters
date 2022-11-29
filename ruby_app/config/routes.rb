Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :resources do
    get 'prev_button', to: 'resources:prev_button', as: 'prev_button'
    get 'next_button', to: 'resources:next_button', as: 'next_button'
  end
  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
end
