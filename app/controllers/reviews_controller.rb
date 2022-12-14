class ReviewsController < ApplicationController
  before_action :authorize_admin, only: [:destroy , :edit ]
  def index
    @local_foods = Product.local_foods
    @recently_added = Product.most_recent
    @most_reviewed_products = Product.most_reviews
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
      flash[:notice] = "review successfully added!"
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
   render :show
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
    flash[:notice] = "review successfully updated!"
    redirect_to product_review_path
   else
    render :edit 
   end
  end

  def destroy
   @review = Review.find(params[:id])
   @review.destroy
   flash[:notice] = "review successfully deleted!"
   redirect_to product_path(@review.product)
  end

  private
  def review_params
    params.require(:review).permit(:author, :rating, :content_body, :product_id)
  end

end