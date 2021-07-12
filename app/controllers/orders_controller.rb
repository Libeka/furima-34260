class OrdersController < ApplicationController

  before_action :set_product, only: [:create, :index]
  before_action :authenticate_user!,except: [:index]

  def index
    #routes.rbよりネストの記述を書いているため、親がresources :productsとあるため[:id]ではなく[:product_id]と書かなくてはいけない
    @product = Product.find(params[:product_id])
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      Payjp.api_key = "sk_test_da7b6aa818a27292b7d2016a"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @product.item_price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      
      return redirect_to root_path
    else
      render :index
    end

   
  end

  private
  def order_params
  params.require(:order_form).permit(:purchase_record_id, :zip_code, :prefecture_id, :city, :address, :phone_number, :building_name).merge(token: params[:token],user_id: current_user.id, product_id: params[:product_id])
  #params.require(:モデル名).permit(:キー名, :キー名)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def redirects_to
    redirect_to root_path unless current_user.id == @order_form.user_id
  end
  
  end
