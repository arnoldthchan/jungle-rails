class ReviewsController < ApplicationController

  def create

    @review = Review.new(
    product_id: params["product_id"],
    user_id: current_user.id,
    description: review_params[:description],
    rating: review_params[:rating]
    )

    if @review.save
      redirect_to product_path (@review.product), notice: 'Review posted!'
    else
      redirect_to product_path (@review.product), notice: 'Review failed to post!'
    end
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end

end
