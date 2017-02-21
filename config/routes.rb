Rails.application.routes.draw do



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login' => 'admin/sessions#new'
  get '/logout' => "admin/sessions#destroy"

  namespace :admin do
    resources :posts do
      resources :comments
    end
    resources :tags, expect: [:index]
    resources :messages, only: [:index, :create, :destroy, :show, :edit, :update]
    resources :visitors, only: [:index, :edit, :destroy, :new, :show]
    resources :moderators, only: [:index, :edit, :update]
    resources :sessions, only: [:new, :destroy, :create]
  end

end
