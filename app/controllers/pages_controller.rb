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
    @shirts = Product.where(sku: 1)
    @vouchers = Product.where(sku: 2)
    @deliveries = Delivery.all
  end

end
