class OrdersController < ApplicationController
  def create
    @product = Product.find_by(id: params[:product_id])
    @calculated_subtotal = params[:quantity] * @product.price
    @calculated_tax = params[:quantity] * @product.tax
    @calculated_total = @calculated_subtotal + @calculated_tax

    @order = Order.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: @calculated_subtotal,
      tax: @calculated_tax,
      total: @calculated_total
    )
    render "show.html.erb"
  end

  def price
    
  end
end
