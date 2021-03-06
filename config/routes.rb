Rails.application.routes.draw do
  

  resources :tickets
  root to:'homes#index'
  get 'homes/daily'
  get 'homes/weekly'
  get 'homes/monthly'
  get 'homes/quarterly'
  get 'homes/all_ticket'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
