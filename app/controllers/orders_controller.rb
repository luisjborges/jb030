class OrdersController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @order  = Order.create!(product: @product, amount_cents: @product.price_cents, state: 'pending', user: current_user)
    authorize @order

    session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: @product.name,
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
  authorize @order
  end

end


# def create
#     @booking = Booking.new(booking_params)
#     @experience = Experience.find(params[:experience_id])
#     @booking.experience_id = params[:experience_id]
#     @booking.price = @experience.price * @booking.people
#     @booking.user = current_user
#     authorize @booking
#     if @experience.bookings.where(date: @booking.date).first
#       redirect_to experience_path(@experience), notice: 'The chosen date is not available anymore'
#     else
#       if @booking.save
#         redirect_to experience_booking_path(@experience, @booking)
#       else
#         redirect_to experience_path(@experience), notice: 'The chosen date is not available anymore'
#       end
#     end
#   end

#    def show
#     @experience = Experience.find(params[:experience_id])
#     @booking = Booking.find(params[:id])
#     @user = current_user
#     authorize @booking
#   end
