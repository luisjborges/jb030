class OrdersController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @product.quantity = params[:quantity]
    @product.size = params[:size]
    @order  = Order.create!(product: @product, state: 'pending', user: current_user, quantity: @product.quantity, size: @product.size)
    @order.amount_cents = (@product.price_cents * @product.quantity)/100
    authorize @order

    session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: @product.name,
      amount: @product.price_cents,
      currency: 'eur',
      quantity: @product.quantity
    }],
    success_url: order_url(@order),
    cancel_url: order_url(@order)
  )

    @order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(@order)
  end

  def show
  @delivery = Delivery.new
  @order = current_user.orders.find(params[:id])
  authorize @order
  end

end
