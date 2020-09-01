class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    if user_signed_in?
      if current_user.id != Item.find(params[:item_id]).user_id
        redirect_to root_path if @item.purchase.present?
        @purchase_buyer = PurchaseBuyer.new
      else
        redirect_to root_path
      end
    else
      redirect_to new_user_registration_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_buyer = PurchaseBuyer.new(purchasebuyer_params)
    if @purchase_buyer.valid?
      pay_item
      @purchase_buyer.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchasebuyer_params
    params.require(:purchase_buyer).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_num, :purchase_id).merge(user_id: current_user.id, item_id: @item.id)
  end

  def token_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(@purchase_buyer.item_id).price,  # 商品の値段
      card: token_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end
end
