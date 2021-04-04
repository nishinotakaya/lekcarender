Rails.application.routes.draw do
  root to: 'blogs#index'
  resources :blogs do
    get 'all_blogs_edit', on: :member
    patch 'all_blogs_update', on: :member
  end  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
