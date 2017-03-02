Rails.application.routes.draw do
  get 'pages/secret'

  root to: "users#new"

#Nested resources; each post belongs to a bar; posts cannot exist without a bar.
  # resources :users do
  #   resources :bars do
  #     resources :posts
  #   end
  # end

  #bars routes
  get "users/:user_id/bars/" => "bars#users_index", as: :user_bars
  get "bars/" => "bars#index", as: :bars
  get "users/:user_id/bars/new" => "bars#new", as: :new_user_bar
  get "users/:user_id/bars/:id" => "bars#show", as: :bar
  post "users/:user_id/bars/" => "bars#create"
  get "users/:user_id/bars/:id/edit" => "bars#edit", as: :edit_bar
  patch "users/:user_id/bars/:id" => "bars#update"
  delete "users/:user_id/bars/:id" => "bars#destroy"

  #posts routes
  get "posts/" => "posts#index"
  get "bars/:bar_id/posts/new" => "posts#new", as: :new_post
  get "posts/:id" => "posts#show", as: :post
  post "posts/" => "posts#create"
  get "posts/:id/edit" => "posts#edit", as: :edit_post
  patch "posts/:id" => "posts#update"
  delete "posts/:id" => "posts#destroy"


  get "users/" => "users#index", as: :users
  # create (post) action for when sign up form is submitted:
  post "users/" => "users#create"
  # sign up page with form:
  get "users/new" => "users#new", as: :new_user
  get "users/:id" => "users#show", as: :user
  get "users/:id/edit" => "users#edit", as: :edit_user
  patch "users/:id" => "users#update"
  delete "users/:id" => "users#destroy"


  # log in page with form:
  get "/login" => "sessions#new"

  # create (post) action for when log in form is submitted:
  post "/login" => "sessions#create"

  # delete action to log out:
  delete "/logout" => "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
