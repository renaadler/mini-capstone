class ProductsController < ApplicationController
  
  def index
    @products = Product.all
    render "index.html.erb"
  end

  def show
    @product = Product.first
    render "mango.html.erb"
  end

end