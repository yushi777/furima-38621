class ItemsController < ApplicationController
  def index
  end
  def new
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :category_id, :price, :product_description, :product_condition_id, :shipping_charge_id, :prefecture_id, :delivery_day_id).merge(user_id: current_user.id)
  end
end
