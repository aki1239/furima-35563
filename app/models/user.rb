class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


        has_many :items
         has_many :histories
        #with_options presence: true do
        validates :nickname,presence: true   #format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
        validates :family_name, presence: true
        validates :first_name, presence: true
        validates :family_name_kana, presence: true
        validates :first_name_kana, presence: true
        validates :birth_date,presence: true
end
