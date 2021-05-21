class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code,:prefecture_id, :city, :home_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
  validates :user_id, :item_id, :home_number, :city, :token
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :phone_number, format: {with: /\A0\d{9,10}\z/ , message: "is invalid"}
  
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "must be other than 1"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code,prefecture_id: prefecture_id,city: city, home_number: home_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end