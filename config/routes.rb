Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login' => 'admin/sessions#new'
  get '/logout' => "admin/sessions#destroy"

  namespace :admin do
    resources :posts
    resources :dashboard, only: [:index]
    resources :notifications, only: [:index, :destroy]
    resources :comments, only: [:index, :update, :destroy]
    resources :tags, expect: [:index]
    resources :messages, only: [:index, :create, :destroy, :show, :edit, :update]
    resources :visitors, only: [:index, :destroy]
    resources :moderators, only: [:index, :edit, :update]
    resources :sessions, only: [:new, :destroy, :create]
  end
  match 'dismiss_all_notification', to: 'admin/notifications#delete_all', via: :delete
end
