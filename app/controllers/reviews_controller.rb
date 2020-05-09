class ReviewsController < ApplicationController

  def create
    @motorcycle = Motorcycle.find(params[:motorcycle_id])
    @review = Review.new(review_params)
    @review.motorcycle = @motorcycle
    @review.user = current_user
    if @review.save
      redirect_to motorcycle_path(@motorcycle)
    else
      render 'motorcycles/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :created_at)
  end

end
