class Order < ApplicationRecord
  #validates :price, presence: true
  has_one :address
  belongs_to :item
  belongs_to :user
end
