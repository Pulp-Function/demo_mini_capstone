class Api::OrdersController < ApplicationController
  def index
    @orders = current_user.orders
    render "index.json.jb"
  end

  def create
    # Open the products table
    # Find the product with an id that matches the product_id given by the user
    product = Product.find_by(id: params[:product_id])
    # Get the price from the product and multiply it by the quantity given by the user
    calculated_subtotal = product.price * params[:quantity].to_i
    # Calculate tax and total
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax
    # Save the order in the database
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    @order.save
    render "show.json.jb"
  end
end
