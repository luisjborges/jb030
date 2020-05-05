class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  include DeliveryHelper

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
  end

end
