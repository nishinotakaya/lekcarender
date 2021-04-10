Rails.application.routes.draw do
  resources :clients
  root "blogs#index"
  resources :blogs do
    get 'all_blogs_edit', on: :collection
    patch 'all_blogs_update', on: :collection
  end  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
