class OrdersController < ApplicationController
  def create
    @product = Product.find_by(id: params[:product_id])
    @calculated_subtotal = params[:quantity].to_i * @product.price
    @calculated_tax = params[:quantity].to_i * @product.tax
    @calculated_total = @calculated_subtotal.to_i + @calculated_tax

    order = Order.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: @calculated_subtotal,
      tax: @calculated_tax,
      total: @calculated_total
    )
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render "show.html.erb"
  end
end
