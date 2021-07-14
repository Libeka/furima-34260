class ProductsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :redirects_to,only:[:edit, :update, :destroy]

  def new
    @product = Product.new
  end

  def index
        #created_atの後の:descはdescendingの略で降順という意味です。
        # ⇩ これで生成されるPostは自動的に並び替えされるようになりました。
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
    if @product.purchase_record.present? 
      redirect_to root_path
    end
  end

  def update
    @product.update(products_params)
    if @product.save
      redirect_to product_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    end
  end

  private

  def products_params
    params.require(:product).permit(:item_name, :item_info, :category_id, :status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :item_price, :user_id, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def redirects_to
    redirect_to root_path unless current_user.id == @product.user_id
  end

    
end