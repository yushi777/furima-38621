class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :token

  with_options presence: true do
  validates :user_id
  validates :item_id
  validates :postal_code,  format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :municipalities
  validates :address
  validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
  validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, building_name: building_name,
                   address: address, phone_number: phone_number)
  end
end
