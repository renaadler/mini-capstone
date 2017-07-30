class OrdersController < ApplicationController
  before_action :authenticate_user!
  def create
    carted_products = current_user.carted_products.where(status: "carted")
    
    calculated_subtotal = 0
    calculated_tax = 0

    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.product.price * carted_product.quantity
      calculated_tax += carted_product.product.tax
      # calcutlated_total += carted_product.product.tax + subtotal
    end
    
    calculated_total = calculated_tax + calculated_subtotal
    
    order = Order.create(
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
      user_id: current_user.id
      )

    carted_products.each do |carted_product|
      carted_product.order_id = order.id 
      carted_product.status = "purchased"
      carted_product.save
    end
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render "show.html.erb"
  end
end