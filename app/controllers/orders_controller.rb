class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order_form = OrderForm.new 
    @item = Item.find(params[:item_id])
  end

  def create
    @order_form = OrderForm.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_form.valid?
      pay_item
      @order_form.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

 

end
