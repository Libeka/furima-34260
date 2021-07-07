class OrdersController < ApplicationController
  include ActiveModel::Model

  def index
    #orders_controllerからorder/index.html.erbへ変数(@product)を代入
    #モデルと紐づいているデータベースのテーブルから、レコードを1つ取り出す場合にfindメソッドを使う(モデル：Product)
    #インスタンス変数は、インスタンスが個別に持つ属性値が入り、そのインスタンスのすべての動作に使用できる変数
    #routes.rbよりネストの記述を書いているため、親がresources :productsとあるため[:id]ではなく[:product_id]と書かなくてはいけない
    @product = Product.find(params[:product_id])
  end

  def create
    @product = OrderForm.new(products_params)
    if @Product.valid?
      @product.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
 #def set_params
   #params.permit(:destination, :purchase_recor)
 #end

  
  end
