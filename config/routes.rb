Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'transfer', to: 'pages#transfer', as: :transfer
  resources :orders, except: :index do
    get 'mailer', to: 'orders#mailer', as: :mailer
    resources :items, only: [:create, :destroy]
  end

  resources :donations
  resources :volunteers, only: [:new, :create]

  resources :solicitations, only: :destroy
  get 'dashboard', to: 'users#dashboard_adm', as: :dashboard_adm
  get 'userdashboard', to: 'users#dashboard_user', as: :dashboard_user
  namespace :admin do
    resources :volunteers, only: [:edit, :update, :destroy]
  end
end
