Rails.application.routes.draw do
  get 'manage/index'

  get 'items/index'
  post 'items' => 'items#create'

  get 'welcome/index'

  root 'welcome#index'

  get 'manage' => 'manage#index'

  get 'delete' => 'items#delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 