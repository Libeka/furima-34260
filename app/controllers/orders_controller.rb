class OrdersController < ApplicationController

  def index
    @product = Product.find(params[:product_id])

  end

  # #def create
  #   #@product = Product.new(product_params)
  #   if @product.save
  #     return redirect_to root_path
  #   else
  #     render :index
  #   end
  # end

  #def product_params
  #end




end
