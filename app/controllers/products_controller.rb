class ProductsController < ApplicationController
  def products_method
    @products = Product.all
    render "products_page.html.erb"
  end

  def mango_product_method
    @product = Product.first
    render "mango_page.html.erb"
  end

end