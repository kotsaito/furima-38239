class PurchaseHistoryOrder
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :tell, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :city
    validates :address
    validates :tell, length: { minimum: 10, maximum: 11 },
                     numericality: { only_integer: true, message: 'is invalid. Input only number' }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase_history = PurchaseHistory.create(item_id: item_id, user_id: user_id)
    Order.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name,
                 tell: tell, purchase_history_id: purchase_history.id)
  end
end
