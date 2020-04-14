class OrdersController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @order  = Order.create!(product: @product, product_sku: @product.sku, amount_cents: @product.price_cents, state: 'pending', user: current_user)
    authorize @order

    session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: @product.sku,
      images: [@product.photo],
      amount: @product.price_cents,
      currency: 'eur',
      quantity: 1
    }],
    success_url: order_url(@order),
    cancel_url: order_url(@order)
  )

    @order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(@order)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

end
