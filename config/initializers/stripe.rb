Rails.configuration.stripe = {
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key:      ENV['STRIPE_SECRET_KEY'],
  signing_secret:  ENV['STRIPE_WEBHOOK_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
StripeEvent.signing_secret = Rails.configuration.stripe[:signing_secret]


StripeEvent.configure do |events|
  events.subscribe 'checkout.session.completed',
    StripeCheckoutSessionService.new
  #   StripeRequestService.new
  # }
end

# StripeEvent.configure do |events|
#   events.subscribe 'checkout.session.completed', StripeRequestService.new
# end




# StripeEvent.configure do |events|
#   events.subscribe "invoice.payment_failed" do |event|
#     stripe_customer_id = user.event.data.object.customer
#     user = User.find_by(stripe_id: stripe_customer_id)
#     PaymentMailer.payment_failed(user).deliver_now if user
#   end
# end


# drinks.each do |hash|
#   hash.each do |k, v|
#     Ingredient.create(name: v)
#   end
# end
