class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :kana_family_name, presence: true
  validates :kana_first_name, presence: true
  validates :nickname, presence: true
  validates :birthday, presence: true

  has_many  :items
  has_many  :purchase_records
end

