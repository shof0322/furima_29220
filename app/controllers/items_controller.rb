class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if user_signed_in?
      if current_user.id != @item.user_id
        render 'show'
      end
    end 
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :price, :category_id, :status_id, :delivery_fee_id, :shipping_origin_id, :days_until_shipping_id).merge(user_id: current_user.id)
  end
end
