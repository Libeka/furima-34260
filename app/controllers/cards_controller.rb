class CardsController < ApplicationController

  def index
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def product_params
    params.require(:product).permit(:price)
  end

end
