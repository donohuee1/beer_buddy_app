Rails.application.routes.draw do
  root to: "users#new"
  get "users/" => "users#index"

  # sign up page with form:
  get "users/new" => "users#new", as: :new_user
  get "users/:id" => "users#show", as: :user

  # create (post) action for when sign up form is submitted:
  post "users/" => "users#create"

  # log in page with form:
  get "/login" => "sessions#new"

  # create (post) action for when log in form is submitted:
  post "/login" => "sessions#create"

  # delete action to log out:
  delete "/logout" => "sessions#destroy"

  get "users/:id/edit" => "users#edit", as: :edit_user
  patch "users/:id" => "users#update"
  delete "users/:id" => "users#destroy"

#Nested resources, meaning, posts cannot exist without a bar.
  resources :bars do
    resources :posts
  end

  # #bars routes
  # get "bars/" => "bars#index"
  # get "bars/new" => "bars#new", as: :new_bar
  # get "bars/:id" => "bars#show", as: :bar
  # post "bars/" => "bars#create"
  # get "bars/:id/edit" => "bars#edit", as: :edit_bar
  # patch "bars/:id" => "bars#update"
  # delete "bars/:id" => "bars#destroy"

  # #posts routes
  # get "posts/" => "posts#index"
  # get "posts/new" => "posts#new", as: :new_post
  # get "posts/:id" => "posts#show", as: :post
  # post "posts/" => "posts#create"
  # get "posts/:id/edit" => "posts#edit", as: :edit_post
  # patch "posts/:id" => "posts#update"
  # delete "posts/:id" => "posts#destroy"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
