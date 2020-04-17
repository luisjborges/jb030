class SettlementsController < ApplicationController
  def new
    @request = current_user.requests.where(state: 'pending').find(params[:request_id])
    authorize @request
  end
end
