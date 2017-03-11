Rails.application.routes.draw do
  devise_for :admins, controllers: { registrations: "registrations"}
  get 'manage/index'

  post 'items' => 'manage#create'
  put 'items' => 'manage#update'
  get 'items' => 'items#get'
  post 'items/claim' => 'items#claim'
  delete 'items' => 'manage#delete'

  get 'welcome/:selection' => 'welcome#index'

  root 'welcome#index'
  root to: 'manage#index'

  get 'manage' => 'manage#index'

  post 'categories' => 'categories#create'
  delete 'categories' => 'categories#destroy'

  post 'rsvp' => 'rsvp#create'

  get 'registry' => 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end