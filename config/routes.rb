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

  scope "/:locale" do
    resources :categories
  end

  # get '/:locale' => 'pictures#bla'
  # root 'pictures#bla'

  get '/:locale' => 'pictures#wellcome'
  root 'pictures#wellcome'
  get 'pictures/wellcome', to: 'pictures#wellcome'

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

  get 'categories/index', as: 'user_root'
end
