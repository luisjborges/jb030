class VouchersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_voucher, only: [:show, :edit, :update, :destroy]

  def index
    @vouchers = Voucher.all
    @vouchers = policy_scope(Voucher).order(created_at: :desc)
  end

  def show; end

  def new
    @voucher = Voucher.new
    authorize @voucher
  end

  def create
    @voucher = Voucher.new(voucher_params)
    @voucher.user = current_user
    authorize @voucher

    if @voucher.save
      redirect_to vouchers_path, notice: "Voucher was succesfully published."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @voucher.update(voucher_params)
      redirect_to voucher_path(@voucher), notice: "Voucher was succesfully updated."
    else
      render :edit
    end
  end

  def destroy
    @voucher.destroy
    redirect_to vouchers_path, notice: "Voucher was succesfully deleted."
  end

  private

  def voucher_params
    params.require(:voucher).permit(:sku, :name, :description, :price_cents)
  end

  def set_voucher
    @voucher = Voucher.find(params[:id])
    authorize @voucher
  end

end
