class Character < ApplicationRecord
  belongs_to :user
  has_many :participations, dependent: :destroy
  has_many :pieces, through: :participations
  has_one_attached :photo
end