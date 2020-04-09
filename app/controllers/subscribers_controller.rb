class SubscribersController < ApplicationController
skip_before_action :authenticate_user!, only: [:new, :create]

  def index
    @subscribers = Subscriber.all
    @subscribers = policy_scope(Subscriber)
  end

  def new
    @subscriber = Subscriber.new
    authorize @subscriber
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    authorize @subscriber
    if @subscriber.save
      cookies[:saved_subscriber] = true
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
