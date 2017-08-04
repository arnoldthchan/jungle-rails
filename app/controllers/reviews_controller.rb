class ReviewsController < ApplicationController
  before_filter :check_login
  def create

    @review = Review.new(
    product_id: params["product_id"],
    user_id: current_user.id,
    description: review_params[:description],
    rating: review_params[:rating]
    )

    if @review.save
      redirect_to product_path (params[:product_id]), notice: 'Review posted!'
    else
      redirect_to product_path (params[:product_id]), notice: 'Review failed to post!'
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path (params[:product_id]) , notice: 'Review deleted!'
  end

  private

  def check_login
    redirect_to product_path (params[:product_id]) if current_user == nil
  end

  def review_params
    params.require(:review).permit(:rating, :description)
  end

end
