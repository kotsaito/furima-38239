class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :user
  # has_one :purchase_history
  has_one_attached :image

  validates :image, presence: true
  validates :product_name,  presence: true
  validates :description,   presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_cost_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,
                    inclusion: { in: 300..9_999_999, message: 'is out of setting range' },
                    format: { with: /\A[0-9]+\z/ },
                    numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }
end
