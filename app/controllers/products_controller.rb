class ProductsController < ApplicationController
  def index
    @products = Product.all
    sort_attributes = params[:sort_by]
    sort_order = params[:sort_order]
    discount = params[:discount]
    
    if sort_attributes
      @products = Product.all.order(sort_attributes => sort_order)
    elsif discount 
      @products = Product.where("price < ?", 6)
    else  
      @products = Product.all
    end
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    product = Product.new(
      name: params[:form_name],
      price: params[:form_price],
      image: params[:form_image],
      description: params[:form_description],
      stock: params[:true]
      )
    product.save
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