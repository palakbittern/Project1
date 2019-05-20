Rails.application.routes.draw do
  devise_for :users
 root :to => "books#index"

 resources :books, only: [:index,:edit,:update,:show,:new ,:create]
  resources :categories
#delete 'books/:id(.:format)', :to => 'books#destroy'
delete 'books/:id(.:format)' => 'books#destroy', :as => :books_delete
  #root 'categories#index'
end