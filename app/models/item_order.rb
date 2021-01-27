class ItemOrder
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :city, :banchi, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :prefecture_id
    validates :city
    validates :banchi
    validates :phone_number, length: { maximum: 11, message: 'is out of setting range' }
  end
  validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'Input only number' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, banchi: banchi,
                   building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
