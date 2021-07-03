class OrderController < ApplicationController

  def index
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      return redirect_to root_path
    else
      render :index
    end

  end


end
