class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase = PurchaseBuyer.new(purchasebuyer_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private

  def purchasebuyer_params
    params.permit(:item_id,:postal_code, :prefecture_id, :city, :address, :building, :phone_num, :purchase_id).merge(user_id: current_user.id)
  end
  
  def purchase_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    # binding.pry
    Payjp::Charge.create(
      amount: Item.find(@purchase.item_id).price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
