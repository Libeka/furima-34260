class OrdersController < ApplicationController
  include ActiveModel::Model
  before_action :set_product, only: [:create, :index]
  before_action :authenticate_user!,except: [:index]
  #before_action :redirect_to, only:[:create, :index]

  def index
    #orders_controllerからorder/index.html.erbへ変数(@product)を代入
    #モデルと紐づいているデータベースのテーブルから、レコードを1つ取り出す場合にfindメソッドを使う(モデル：Product)
    #インスタンス変数は、インスタンスが個別に持つ属性値が入り、そのインスタンスのすべての動作に使用できる変数
    #routes.rbよりネストの記述を書いているため、親がresources :productsとあるため[:id]ではなく[:product_id]と書かなくてはいけない
    @product = Product.find(params[:product_id])
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
  params.require(:order_form).permit(:card_number, :card_exp_month, :card_exp_year, :card_cvc, :destination, :purchase_record, :postal_code, :prefecture_id, :city, :addresses, :phone_number)
  #params.require(:モデル名).permit(:キー名, :キー名)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def redirects_to
    redirect_to root_path unless current_user.id == @order_form.user_id
  end
  
  end
