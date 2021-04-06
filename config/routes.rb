Rails.application.routes.draw do
  devise_scope :user do
    root "users/sessions#new"
  end
  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users

  resources :blogs do
    get 'all_blogs_edit', on: :member
    patch 'all_blogs_update', on: :member
  end  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
