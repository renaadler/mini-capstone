
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "products#index"
  get "/products" => "products#index"
  get "/products/new" => "products#new"
  post "/products" => "products#create"
  get "/products/:id" => "products#show"
  get "/products/:id/edit" => "products#edit"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  get "/suppliers" => "suppliers#supplier_index"
  get "/suppliers/new" => "suppliers#supplier_new"
  post "/suppliers" => "suppliers#supplier_create"
  get "/suppliers/:id" => "suppliers#supplier_show"
  get "/suppliers/:id/edit" => "suppliers#supplier_edit"
  patch "/suppliers/:id" => "suppliers#supplier_update"
  delete "/suppliers/:id" => "suppliers#supplier_destroy"

  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  post "/carted_products" => "carted_products#create"
  get "/checkout_screen" => "carted_products#index"
  post "/orders" => "orders#create"
  get "/orders/:id" => "orders#show"
end
