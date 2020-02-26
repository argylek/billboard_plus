Rails.application.routes.draw do
  get 'songs/index'
  get 'songs/new'
  get 'songs/show'
  get 'songs/_form'
  get 'artists/index'
  get 'artists/new'
  get 'artists/show'
  get 'artists/_form'
  get 'billboards/index'
  get 'billboards/new'
  get 'billboards/show'
  get 'billboards/edit'
  get 'billboards/_form'
  devise_for :users
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
