class VoucherpaymentsController < ApplicationController
  def new
    @order = current_user.orders.where(state: 'pending').find(params[:voucher_id])
    authorize @ordervoucher
  end
end
