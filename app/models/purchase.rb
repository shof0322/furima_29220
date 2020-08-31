class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :buyer

  validates :user_id, :item_id, presence: true
end
