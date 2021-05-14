class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :price,numericality: {greater_than_or_equal_to: 300,less_than: 9999999 }, format: { with: /\A^[0-9]*$\z/ }
    #validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :description, length: { maximum: 1000 }
    validates :image
    end

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
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :prefecture_id
    validates :days_id
    validates :user_id
    
  end
end
