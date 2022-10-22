class ReviewsController < ApplicationController
  

  def index
    @reviews = Review.all
    render :index
  end

  
  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end


  def edit
    @review = Review.find(params[:id])
    render :edit
  end

  def show
   @review = Review.find(params[:id])
   render :show
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
    redirect_to reviews_path
   else
     render :edit
   end
  end

  def destroy
   @review = Review.find(params[:id])
   @review.destroy
   redirect_to review_path
  end

  private
  def review_params
    params.require(:review).permit(:author, :rating, :content_body, :product_id)
  end

end