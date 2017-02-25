Rails.application.routes.draw do

root "posts#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login' => 'admin/sessions#new'
  get '/logout' => "admin/sessions#destroy"

  namespace :admin do
    resources :posts
    resources :settings, only: [:new, :create, :edit, :update]
    resources :dashboard, only: [:index]
    resources :notifications, only: [:index, :destroy]
    resources :comments, only: [:index, :update, :destroy]
    resources :tags, expect: [:index]
    resources :messages, only: [:index, :create, :destroy, :show, :edit, :update]
    resources :visitors, only: [:index, :destroy]
    resources :moderators, only: [:index, :edit, :update, :show]
    resources :sessions, only: [:new, :destroy, :create]
  end
  resources :posts, only: [:index, :show]
  resources :messages, only: [:new, :create]
  resources :comments, only: [:create]



  match 'dismiss_all_notification', to: 'admin/notifications#delete_all', via: :delete
end
