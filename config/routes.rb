Rails.application.routes.draw do

  #resources :user_friendlies
  ActiveAdmin.routes(self)
  devise_for :users, ActiveAdmin::Devise.config

  root 'pictures#bla'

  resources :categories, only: [:index, :show] do
    resources :pictures, only: [:index] do
      resource :comments, only: [:index]
    end
  end

  #get 'categories/:id', to: 'categories#show', as: :categories_name

  post 'pictures/comments', to: 'comments#create', as: :picture_comments

  get 'all_comments', to: 'comments#index'

  get 'events', to: 'events#index'

  get 'categories/:category_name/:id', to: 'pictures#show', as: :picture_by_category

  resources :pictures do
    resource :like
  end

  get 'persons/profile', as: 'user_root'
end
