class ProductsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  before_action :set_tweet, only: [:edit, :show, :update]

  def new
    @product = Product.new
  end

  def index
    @products = Product.all.order("created_at DESC")
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    redirect_to root_path unless current_user.id == @product.user_id
  end

  def update
    redirect_to root_path unless current_user.id == @product.user_id
    @product.update(products_params)
    if @product.save
      redirect_to product_path
    else
      render :edit
    end
  end




  def show
  end

  private

  def products_params
    params.require(:product).permit(:item_name, :item_info, :category_id, :status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :item_price, :user_id, :image).merge(user_id: current_user.id)
  end

    
end