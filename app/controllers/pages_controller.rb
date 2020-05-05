class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def about
  end

  def faq
  end

  def imprint
  end

  def agb
  end

  def admin
    @orders = Order.all
    @completed_orders = []
    @orders.each do |order|
      checkout_id = order.checkout_session_id
      @completed_orders << sessions = Stripe::Checkout::Session.retrieve(checkout_id)
    end
    @deliveries = Delivery.all
  end

end
