Rails.application.routes.draw do
  devise_scope :user do
    root "users/sessions#new"
  end
  devise_for :users, :controllers => {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  resources :users

  resources :blogs do
    get 'all_blogs_edit', on: :collection
    patch 'all_blogs_update', on: :collection
  end  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
