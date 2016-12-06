Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users, ActiveAdmin::Devise.config

  root 'pictures#bla'

  resources :categories, only: [:index, :show] do
    resources :pictures, only: [:index] do
      resource :comments, only: [:index]
    end
  end

  #get 'categories/:id', to: 'categories#show', as: :categories_name

  post 'pictures/:picture_id/comments', to: 'comments#create', as: :picture_comments

  get 'all_comments', to: 'comments#index'

  resources :pictures do
    resource :like
  end

  get 'persons/profile', as: 'user_root'
end
