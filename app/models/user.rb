class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :name_first, :name_last, :name_kana_first, :name_kana_last, :birthday, presence: true;
  validates :name_first, :name_last, format: {with: /\A[ぁ-んァ-ン一-龥]/};
  validates :name_kana_first, :name_kana_last, format: {with: /\A[ァ-ヶー－]+\z/};
  
end
