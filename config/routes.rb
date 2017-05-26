Rails.application.routes.draw do

  get 'pictures/wellcome', to: 'pictures#wellcome'
  root 'pictures#wellcome'

  ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session_omniouth
  end

  scope '(:locale)', locale: /en|ru/ do
    get '/' => 'pictures#wellcome', as: :locale_root do
    resources :categories, only: [:index, :show] do
      resourses :pictures, only: [:wellcome, :index, :show]
      end
    end
  end

  resources :users, only: [:show, :edit, :update, :destroy]
  resources :categories, only: [:index, :show] do
    resources :pictures, only: [:index, :show, :wellcome] do
      resource :comments, only: [:index]
    end
  end

  post 'pictures/comments', to: 'comments#create', as: :picture_comments
  get 'all_comments', to: 'comments#index'
  get 'categories/:category_name/:id', to: 'pictures#show', as: :picture_by_category

  resources :pictures, only: [:index, :show, :wellcome] do
    resource :like, only: [:index, :create]
  end
  get 'categories/index', as: 'user_root'
end
