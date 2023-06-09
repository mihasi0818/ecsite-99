Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :admin do
    resources :customers, only: %i[index show]
  end

  namespace :customer do
    get 'customers/confirm_withdraw'
    resources :orders, only: %i[index show]
    get 'orders/success', to: 'orders#success'
    resources :cart_items, only: %i[index create destroy] do
      member do
        patch 'increase'
        patch 'decrease'
      end
    end
    resources :products, only: %i[index show]
  end

  devise_for :sellers, controllers: {
    sessions: 'seller/sessions',
    registrations: 'seller/registrations'
  }

  devise_for :customers, controllers: {
    sessions: 'customer/sessions',
    registrations: 'customer/registrations'
  }

  root to: 'home#top'

  namespace :seller do
    root to: 'pages#home'
    get 'orders/show'
    get 'pages/home'
    resources :products, only: %i[index show new create edit update]
    resources :orders, only: %i[show update]
  end

  scope module: :customer do
    resources :products, only: %i[index show]
    resources :cart_items, only: %i[index create destroy] do
      member do
        patch 'increase'
        patch 'decrease'
      end
    end
    resources :checkouts, only: [:create]
    resources :webhooks, only: [:create]
    resources :orders, only: %i[index show] do
      collection do
        get 'success'
      end
    end
    resources :customers do
      collection do
        get 'confirm_withdraw'
        patch 'withdraw'
      end
    end
    resources :customers do
      collection do
        get 'confirm_withdraw'
        patch 'withdraw'
      end
    end
  end
  
  get '/up/', to: 'up#index', as: :up
 get '/up/databases', to: 'up#databases', as: :up_databases
end
