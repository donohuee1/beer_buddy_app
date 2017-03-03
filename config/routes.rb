Rails.application.routes.draw do
  get 'pages/secret'

  root to: "bars#index"

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
  get "users/:user_id/bars/:bar_id/posts/" => "posts#index", as: :all_posts
  get "users/:user_id/bars/:bar_id/posts/new" => "posts#new", as: :new_user_bar_post
  #get "posts/:id" => "posts#show", as: :post
  get "users/:user_id/bars/:bar_id/posts/:id" => "posts#show", as: :user_bar_post
  post "users/:user_id/bars/:bar_id/posts" => "posts#create", as: :user_bar_posts
  get "users/:user_id/bars/:bar_id/posts/:id/edit" => "posts#edit", as: :edit_user_bar_post
  patch "users/:user_id/bars/:bar_id/posts/:id" => "posts#update"
  delete "users/:user_id/bars/:bar_id/posts/:id" => "posts#destroy"

  #responses routes
  # get "users/:user_id/responses/" => "responses#users_index", as: :user_responses
  # get "responses/" => "responses#index", as: :responses
  # get "users/:user_id/responses/new" => "responses#new", as: :new_user_response
  # get "users/:user_id/responses/:id" => "responses#show", as: :response
  # post "users/:user_id/responses/" => "responses#create"
  # get "users/:user_id/responses/:id/edit" => "responses#edit", as: :edit_response
  # patch "users/:user_id/responses/:id" => "responses#update"
  # delete "users/:user_id/responses/:id" => "responses#destroy"
  # get "users/:user_id/responses/:response_id/posts/" => "posts#index"
  # get "users/:user_id/responses/:response_id/posts/new" => "posts#new", as: :new_user_response_post
  # #get "posts/:id" => "posts#show", as: :post
  # get "users/:user_id/responses/:response_id/posts/:id" => "posts#show", as: :user_response_post
  # post "users/:user_id/responses/:response_id/posts" => "posts#create", as: :user_response_posts
  # get "users/:user_id/responses/:response_id/posts/:id/edit" => "posts#edit", as: :edit_user_response_post
  # patch "users/:user_id/responses/:response_id/posts/:id" => "posts#update"
  # delete "users/:user_id/responses/:response_id/posts/:id" => "posts#destroy"


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
  delete "logout/" => "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
