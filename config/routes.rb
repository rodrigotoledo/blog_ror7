Rails.application.routes.draw do
  resources :posts
  get 'pages/home'
  get 'pages/posts', as: :last_posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
