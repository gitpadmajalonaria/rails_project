Rails.application.routes.draw do
 
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  #root 'users/sign_up'
  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
  