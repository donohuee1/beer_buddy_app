Rails.application.routes.draw do
  root "users#index"
  get "users/" => "users#index"
  get "users/new" => "users#new", as: :new_user
  get "users/:id" => "users#show", as: :user
  get "bars/" => "bars#index"
  get "bars/new" => "bars#new", as: :new_bar
  get "bars/:id" => "bars#show", as: :bar
  post "bars/" => "bars#create"
  get "bars/:id/edit" => "bars#edit", as: :edit_bar
  patch "bars/:id" => "bars#update"
  delete "bars/:id" => "bars#destroy"
  post "users/" => "users#create"
  get "users/:id/edit" => "users#edit", as: :edit_user
  patch "users/:id" => "users#update"
  delete "users/:id" => "users#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
