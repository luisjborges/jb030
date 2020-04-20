class DeliveriesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_order

  def new
    @delivery = Delivery.new
    authorize @delivery
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.user = current_user
    @delivery.order = @order
    authorize @delivery
    @delivery.save!
    if @delivery.save
      redirect_to order_delivery_path(@order, @delivery), notice: 'Thanks so much for your help!'
    else
      redirect_to order_path(@order), notice: 'Please review the form'
    end
  end

  def show
  @delivery = Delivery.new
  authorize @delivery
  end

  private

  def find_order
    @order = Order.find(params[:order_id])
  end

  def delivery_params
    params.require(:delivery).permit(:first_name, :last_name, :email, :street, :house_number, :city, :post_code, :country)
  end
end
