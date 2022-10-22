class ProductsController < ApplicationController
  

  def index
    @products = Product.all
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
   @product = Product.new(product_params)
   if @product.save
    flash[:notice] = "product successfully created!"
   redirect_to products_path
   else
    render :new, status: :unprocessable_entity
   end
  end


  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
   @product = Product.find(params[:id])
   render :show
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "product successfully updated!"
    redirect_to products_path
   else
     render :edit
   end
  end

  def destroy
   @product = Product.find(params[:id])
   @product.destroy
   flash[:notice] = "product successfully deleted!"
   redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :country_of_origin, :cost)
  end
  
end