Rails.application.routes.draw do
  namespace :customer do
    get 'cart_items/index'
  end
  
  
    devise_for :sellers, controllers: {
    sessions: 'seller/sessions',
    registrations: 'seller/registrations'
  }
  devise_for :customers, controllers: {
    sessions: 'customer/sessions',
    registrations: 'customer/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#top"

  namespace :seller do
    resources :products, only: %i[index show new create edit update]
end
scope module: :customer do
  resources :products, only: %i[index show]
  resources :cart_items, only: %i[index create destroy] do
    member do
      patch 'increase'
      patch 'decrease'
    end
  end
end

namespace :customer do
  get 'products/index'
  get 'products/show'
end
namespace :seller do
  get 'products/index'
  get 'products/show'
  get 'products/new'
  get 'products/edit'
end

end