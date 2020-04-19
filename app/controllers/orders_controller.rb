class OrdersController < ApplicationController

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

end

# create_table "orders", force: :cascade do |t|
#     t.string "state"
#     t.string "product_sku"
#     t.integer "amount_cents", default: 0, null: false
#     t.string "checkout_session_id"
#     t.bigint "user_id", null: false
#     t.bigint "product_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.integer "quantity"
#     t.integer "total"
#     t.index ["product_id"], name: "index_orders_on_product_id"
#     t.index ["user_id"], name: "index_orders_on_user_id"
#   end

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
