class OrdersController < ApplicationController

  before_action :set_product 
  
  before_action :authenticate_user!
  before_action :redirects_to


  def index
    @order_form = OrderForm.new
    
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      return redirect_to root_path
    else
      render :index
    end

  end

  private
  def order_params
  params.require(:order_form).permit(:zip_code, :prefecture_id, :city, :address, :phone_number, :building_name).merge(token: params[:token],user_id: current_user.id, product_id: params[:product_id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def redirects_to
    if current_user.id == @product.user_id || @product.purchase_record.present?  
      return redirect_to root_path 
    end

  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.item_price,  
      card: order_params[:token],    
      currency: 'jpy'                
    )
  end

  
  
  end
