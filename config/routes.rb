Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :user_step_logs do
    resources :favorites, only: [:create, :destroy]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
