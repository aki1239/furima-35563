class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000 }, format: { with: /\A^[0-9]*$\z/ }
    # validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :description, length: { maximum: 1000 }
    validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :days

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :prefecture_id
    validates :days_id
  end

  with_options presence: true do
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :prefecture_id
    validates :days_id
    validates :user_id
  end
end
