class ProductsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  
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
  
  #def show
  #@product = Product.find(params[:id])
  #end
  # ↑ 詳細機能の時に定義する
  
  private
  
  def products_params
  params.require(:product).permit(:item_name, :item_info, :category_id, :status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :item_price, :user_id, :image).merge(user_id: current_user.id)
  end
  
end
  