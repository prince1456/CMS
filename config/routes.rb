Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login' => 'admin/sessions#new'
  get '/logout' => "admin/sessions#destroy"

  namespace :admin do
    resources :posts
    resources :moderators, only: [:index, :edit, :update]
    resources :sessions, only: [:new, :destroy, :create]
  end
end
