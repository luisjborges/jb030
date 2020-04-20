class OrdersController < ApplicationController
# before_action :find_order

  def new
    @order = Order.new(order_params)
    authorize @order
    redirect_to root_path
  end

  def create
    @product = Product.find(params[:product_id])
    @product.quantity = params[:quantity]
    @order  = Order.create!(product: @product, state: 'pending', user: current_user)
    @order.total = (@product.price_cents * @product.quantity)/100
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
  @order = current_user.orders.find(params[:id])
  authorize @order
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:first_name, :last_name)
  end

end
