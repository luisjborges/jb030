class OrdersController < ApplicationController

  def new
    @order = Order.find(params[:order_id])
    authorize @order
    redirect_to root_path
  end

  def create
    @product = Product.find(params[:product_id])
    @product.quantity = params[:quantity]
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
  @order = current_user.orders.find(params[:id])
  authorize @order
  end

end

# def new
#     @dress = Dress.find(params[:dress_id])
#     @booking = Booking.new
#     authorize @booking
#   end

#   def create
#     @booking = Booking.new(booking_params)
#     @dress = Dress.find(params[:dress_id])
#     @booking.user = current_user
#     @booking.dress = @dress
#     @dress.available = false
#     authorize @booking
#     if @booking.save && @dress.save
#       redirect_to user_dashboard_path, notice: 'Booking was successful'
#     else
#       render :new
#     end
#   end

#   private

#   def set_dress
#     @dress = Dress.find(params[:id])
#   end

#   def booking_params
#     params.require(:booking).permit(:rent_date, :dress_id)
#   end
# end
