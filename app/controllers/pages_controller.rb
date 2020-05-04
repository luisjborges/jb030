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
    @deliveries = Delivery.all
    authorize @deliveries
  end

end
