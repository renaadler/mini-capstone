class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  def index
    if current_user
      sort_attributes = params[:sort_by]
      sort_order = params[:sort_order]
      discount = params[:discount]
      search_terms = params[:search_terms]
      
      if discount 
        @products = Product.all.where("price < ?", 6)
      elsif search_terms
        @products = Product.all.where("name iLIKE ?", "%" + search_terms + "%")
      else  
        @products = Product.all
      end

      if sort_attributes
        @products = @products.order(sort_attributes => sort_order)
      end

      category_name = params[:category]
      if category_name
        category = Category.find_by(name: category_name)
        @products = category.products
      end
      render "index.html.erb"
    else
        @products = Product.all
    end
  end

  def new
    render "new.html.erb"
  end

  def create
    product = Product.create(
      name: params[:form_name],
      price: params[:form_price],
      # image: params[:form_image],
      description: params[:form_description],
      stock: params[:true]
      )
    Image.create(
      url: params[:form_image],
      product_id: Product.id
      )
    flash[:success] = "Smoothie Successfully Created!"
    redirect_to "/products/#{product.id}"
  end

  def show
    random = params[:random]
    product_id = params["id"]
    if random
      @product = Product.all.order("RANDOM()").first
    else
      @product = Product.find_by(id: product_id)
    end
    render "show.html.erb"
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "edit.html.erb"
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.name = params[:form_name]
    @product.price = params[:form_price]
    @product.image = params[:form_image]
    @product.description = params[:form_description]
    @product.stock = params[:form_stock]

    @product.save
    flash[:success] = "Smoothie Successfully Updated!"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    flash[:danger] = "Smoothie Successfully Deleted!"
    redirect_to "/products"
  end
end
