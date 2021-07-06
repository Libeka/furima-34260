class OrdersController < ApplicationController
  include ActiveModel::Model

  def index
  end

  def create
  @product = OrderForm.new(products_params)
    if @product.save
      return redirect_to root_path
    else
      render :index
    end
  end

end