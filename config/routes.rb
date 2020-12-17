Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  resources :tours
  #devise_for :users, controllers: {sessions: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to:'static_pages#index',  kind: 'все'
   get 'tours/index' , kind: 'все'
  get 'tours_with_kind/:kind', to:'tours#index', as: 'tour_with_kind'
  get 'profile', to: 'profile#index', as: 'profile'
end
