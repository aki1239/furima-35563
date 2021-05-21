class Order < ApplicationRecord
  #validates :price, presence: true
  has_one :address
  has_many :order
  belongs_to :item
  belongs_to :user
end
