Rails.application.routes.draw do
  devise_for :admins
  devise_for :publics, :controllers => {
    :registrations => "publics/registrations",
    :sessions => "publics/sessions"
  }
  devise_scope :public do
    get "sign_up", :to => "publics/registrations#new"
  end

  root to: "public/homes#top"

  post "admin_genres_index" => "genres#create"

  namespace :public do
    resources:addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  namespace :public do
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
    resources:orders, only: [:new, :confirm, :complete, :create, :index, :show]
  end
  namespace :public do
    resources:cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  end
  namespace :public do
    get "customers/confirm" => "customers#confirm"
    patch "customers/withdrawal" => "customers#withdrawal"
    resources :customers, only: [:show, :edit, :update, :confirm, :withdrawal]
  end
  namespace :public do
    resources :items, only: [:index, :show]
  end
  namespace :public do
    get "about" => "homes#about"
    resources :homes, only: [:top, :about]
  end
  namespace :admin do
    resources :making_status, only: [:update]
  end
  namespace :admin do
    resources :order_status, only: [:update]
  end
  namespace :admin do
    resources :order_items, only: [:show]
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  namespace :admin do
    get "admin/top" => "homes#top"
    resources :homes, only: [:homes]
  end

  namespace :admin do
    resources :item_images, only:[:new, :create, :index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
