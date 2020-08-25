class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :price, :category_id, :status_id,
       :delivery_fee_id, :shipping_origin_id, :days_until_shipping_id).merge(user_id: current_user.id)
  end
end
