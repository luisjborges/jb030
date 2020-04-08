class SubscribersController < ApplicationController

  def index
    @subscriber = Subscriber.new
  end

  def create
    @subcriber = Subscriber.new(subscriber_params)
    if @subscriber.saved_subscriber
      cookies[:saved_lead] = true
      redirect_to root_path, notice: "Saved succesfully"
    else
      redirect_to rooth_path, notice: "Failed to saved_lead"
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:name, :email)
  end
end
