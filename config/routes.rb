Rails.application.routes.draw do

  get 'pictures/wellcome', to: 'pictures#wellcome'
  root 'pictures#wellcome'

  get 'parser/yandex'
  # post 'users/sign_in', to: 'devise/sessions#create', as: :log_in
  get 'users/log_in', to: 'devise/sessions#new'

  ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # get 'users/sign_up', to: 'registrations#new'

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

  resources :categories, only: [:index, :show] do
    resources :pictures, only: [:index, :show, :wellcome] do
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
  #get 'persons/profile', as: 'user_root'
  get 'categories/index', as: 'user_root'
end
