class PurchaseBuyer
  include ActiveModel::Validations
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_num, :token

  validates :user_id, :item_id, presence: true # purchaseテーブル
  validates :postal_code, :prefecture_id, :city, :address, :building, :phone_num, presence: true # buyerテーブル
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_num, format: { with: /\A\d{11}\z/ }

  def save
    # 購入情報を保存し、「purchase」という変数に入れている
    purchase = Purchase.create!(user_id: user_id, item_id: item_id)
    # 購入者の情報を保存
    Buyer.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_num: phone_num, purchase_id: purchase.id)
  end
end
