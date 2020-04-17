class OrdervouchersController < ApplicationController
   def create
    @voucher = Voucher.find(params[:voucher_id])
    @ordervoucher  = Order.create!(voucher: @voucher, voucher_sku: @voucher.sku, amount_cents: @voucher.price_cents, state: 'pending', user: current_user)
    authorize @ordervoucher

    session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: @voucher.name,
      images: [@voucher.photo.key],
      amount: @voucher.price_cents,
      currency: 'eur',
      quantity: 1
    }],
    success_url: order_url(@ordervoucher),
    cancel_url: order_url(@ordervoucher)
  )

    @ordervoucher.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(@ordervoucher)
  end

  def show
  @ordervoucher = current_user.orders.find(params[:id])
  end
end
