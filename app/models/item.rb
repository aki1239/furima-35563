class Item < ApplicationRecord

  belongs_to :user_id
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1 }
  belongs_to :status
  validates :status_id, numericality: { other_than: 1 }
  belongs_to :cost
  validates :cost_id, numericality: { other_than: 1 }
  belongs_to :prefecture
  validates :prefecture_id, numericality: { other_than: 1 }
  belongs_to :days
  validates :days_id, numericality: { other_than: 1 }

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
