class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :days_until_shipping

  has_one_attached :image
  belongs_to :user
  has_one :buyer
  has_one :purchase

  # 空の商品情報を保存できないようにする
  with_options presence: true do
    validates :image, :name, :explanation, :price, :category_id, :status_id, :delivery_fee_id, :shipping_origin_id, :days_until_shipping_id
  end

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id, :status_id, :delivery_fee_id, :shipping_origin_id, :days_until_shipping_id
  end

  regexp = /\A[0-9]+\z/
  validates :price, numericality: { greater_than_or_equal_to: 300 } # 数字が300以上であるか
  validates :price, numericality: { less_than_or_equal_to: 9_999_999 } # 数字が9,999,999以下であるか
  validates :price, format: { with: regexp } # 半角数字のみ
end
