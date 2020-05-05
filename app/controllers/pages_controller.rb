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
    @orders = Order.where(state: "paid")
    @deliveries = Delivery.all
  endg

end
