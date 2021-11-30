Rails.application.routes.draw do
  resources :lek_urls
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    omniauth_callbacks: "omniauth_callbacks"
}
  devise_scope :user do
    root :to => "users/sessions#new"
  end

  resources :clients do
    get 'text_index', on: :collection
  end

  resources :blogs do
    get 'all_blogs_edit', on: :collection
    patch 'all_blogs_update', on: :collection
    patch 'blogs_month_update', on: :collection
  end
  resources :todos, only: [:index]
  
  resources :planning_papers

  post "/search-birthday" => "clients#search-birthday"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
