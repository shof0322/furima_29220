class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  regexp_name = /\A[ぁ-んァ-ン一-龥]/
  regexp_name_kana = /\A[ァ-ヶー－]+\z/
  regexp_password = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,100}+\z/

  with_options presence: true do
    validates :nickname, :birthday
    validates :email, uniqueness: true
    validates :name_first, :name_last, format: { with: regexp_name }
    validates :name_kana_first, :name_kana_last, format: { with: regexp_name_kana }
    validates :password, format: { with: regexp_password }
  end
end
