class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
   validates :first_name
   validates :family_name
   validates :kana_family_name
   validates :kana_first_name
   validates :nickname
   validates :birthday
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'Include both letters and numbers' }
  
  with_options presence: true do
    with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Full-width characters'} do
     validates :first_name
     validates :family_name
    end
  
    with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'} do
     validates :kana_first_name
     validates :kana_family_name
    end
  end
  
  has_many  :items
  has_many  :purchase_records



end

