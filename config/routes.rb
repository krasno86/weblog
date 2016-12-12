Rails.application.routes.draw do

  get 'parser/yandex'

  # ActiveAdmin.routes(self)
  # devise_for :users, ActiveAdmin::Devise.config

  ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session_omniouth
  end

  root 'pictures#bla'

  resources :categories, only: [:index, :show] do
    resources :pictures, only: [:index] do
      resource :comments, only: [:index]
    end
  end

  get 'parser/juventus', to: 'parser#juventus'

  post 'pictures/comments', to: 'comments#create', as: :picture_comments

  get 'all_comments', to: 'comments#index'

  get 'events', to: 'events#index'

  get 'categories/:category_name/:id', to: 'pictures#show', as: :picture_by_category

  resources :pictures do
    resource :like
  end

  get 'persons/profile', as: 'user_root'
end
