class ProductsController < ApplicationController
  def products_method
    @products = Product.all
    render "products_page.html.erb"
  end
end

# +  def one_contact_method
#  +    @contact = Contact.first
#  +    render "one_contact.html.erb"
#  +  end