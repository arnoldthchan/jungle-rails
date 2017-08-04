class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user_id = current_user

    if @review.save
      redirect_to :root
    else
      redirect_to :root
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end

end
