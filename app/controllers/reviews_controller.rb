class ReviewsController < ApplicationController
  before_action :find_product, except: [:destroy]

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.product = @product
    authorize @review
    if @review.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    authorize @review
    redirect_to product_path(@review.product)
  end

  private

  def find_product
    @product = Product.find(params[:product_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
