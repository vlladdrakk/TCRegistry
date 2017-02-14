Rails.application.routes.draw do
  devise_for :admins
  get 'manage/index'

  post 'items' => 'manage#create'
  put 'items' => 'manage#update'
  get 'items' => 'manage#get'
  post 'items/claim' => 'manage#claim'
  delete 'items' => 'manage#delete'

  get 'welcome/:selection' => 'welcome#index'

  root 'items#index'
  root to: 'manage#index'

  get 'manage' => 'manage#index'

  post 'categories' => 'categories#create'
  delete 'categories' => 'categories#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 