class ProductsController < ApplicationController
  before_action :authenticate_user!,except: [:index]

  def new
    @product = Product.new
  end

  def index
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def products_params
    params.require(:product).permit(:item_name, :item_info, :category_id, :status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :item_price, :user_id, images: []).merge(user_id: current_user.id)
  end

    
end
