class Item < ApplicationRecord
  belongs_to :user
  has_one :order

  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charge


  has_one_attached :image

  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :image, presence: true
  validates :category_id, presence: true
  validates :product_condition_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true



  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :product_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { other_than: 1 }

end
