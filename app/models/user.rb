class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchase_histories

  validates :nickname,   presence: true
  validates :last_name,  presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Last name is invalid. Input full-width characters' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'First name is invalid. Input full-width characters' }
  validates :sei_kana,   presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Last name kana is invalid. Input full-width katakana characters' }
  validates :mei_kana,   presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'First name kana is invalid. Input full-width katakana characters' }
  validates :birthday,   presence: true
end
