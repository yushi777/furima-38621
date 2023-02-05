class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :token

  # ここにバリデーションの処理を書く
  validates :user_id, presence: true 
  validates :item_id, presence: true 
  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, presence: true
  validates :municipalities, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
  # validates :token, presence: true



  def save
    # 各テーブルにデータを保存する処理を書く
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, phone_number: phone_number)
  end
end