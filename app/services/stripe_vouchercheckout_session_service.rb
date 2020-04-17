class StripeVoucherCheckoutSessionService
  def call(event)
    voucher = Voucher.find_by(checkout_session_id: event.data.object.id)
    voucher.update(state: 'paid')
  end
end
