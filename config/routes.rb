
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/products_url" => "products#products_method"
  get "/mango_product_url" => "products#mango_product_method"
end
