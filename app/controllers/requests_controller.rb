class RequestsController < ApplicationController

  def create
    @voucher = Voucher.find(params[:voucher_id])
    @request  = Request.create!(voucher: @voucher, voucher_sku: @voucher.sku, amount_cents: @voucher.price_cents, state: 'pending', user: current_user)
    authorize @request

    session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: @voucher.name,
      images: [@voucher.photo.key],
      amount: @voucher.price_cents,
      currency: 'eur',
      quantity: 1
    }],
    success_url: request_url(@request),
    cancel_url: request_url(@request)
  )

    @request.update(checkout_session_id: session.id)
    redirect_to new_request_settlement_path(@request)
  end

  def show
  @request = current_user.requests.find(params[:id])
  authorize @request
  end

end
