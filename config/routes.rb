Rails.application.routes.draw do
  get 'manage/index'

  post 'items' => 'items#create'
  put 'items' => 'items#update'
  get 'items' => 'items#get'

  get 'welcome/:selection' => 'welcome#index'

  root 'welcome#index'

  get 'manage' => 'manage#index'

  get 'delete' => 'items#delete'

  post 'categories' => 'categories#create'
  delete 'categories' => 'categories#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 