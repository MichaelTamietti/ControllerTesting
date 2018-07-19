Rails.application.routes.draw do
  devise_for :users
  
  root 'bank_accounts#index'

  resources :bank_accounts
end
