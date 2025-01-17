class ReviewsController < ApplicationController
  def create
    # raise "Yay, I'm here!"
     
    @product = Product.find params[:product_id]
    @review = @product.reviews.build(review_params)
    @review.user_id = current_user.id
    puts @review.user_id
     @review.save!
    redirect_to product_url(@product)
  end

  def destroy
    @product = Product.find params[:product_id]
    @review = Review.find params[:id]
    @review.destroy
    # redirect_to product_url(@product)
    redirect_to @product
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end




end
