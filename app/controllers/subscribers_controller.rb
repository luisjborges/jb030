class SubscribersController < ApplicationController
skip_before_action :authenticate_user!, only: [:create, :index]

  def index
    @subscriber = Subscriber.new
    authorize @subscriber
    @subscribers = policy_scope(Subscriber)
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    authorize @subscriber
    @subscriber.save!
    if @subscriber.save
      cookies[:saved_subscriber] = true
      redirect_to subscribers_path, notice: "Thanks for supporting"
    else
       redirect_to root_path, "#sign-up", notice: "These fields cant be empty"
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:name, :email)
  end
end
