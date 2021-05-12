class Item < ApplicationRecord

  belongs_to :user_id
  with_options presence: true do
    validates :name
    validates :price
    validates :description
    validates :category_id
    validates :string
    validates :cost_id
    validates :prefecture_id
    validates :days_id
    validates :user_id
  end
end
