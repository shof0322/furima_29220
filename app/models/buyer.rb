class Buyer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  #空の投稿を保存できないようにする
  validates :postal_code, :prefecture_id, :city, :address, :building, :phone_num, :purchase, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :prefecture_id, numericality: { other_than: 1 }

  belongs_to :purchase
end
