class Piece < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :participations, dependent: :destroy
  has_many :characters, through: :participations
  has_one_attached :photo
  accepts_nested_attributes_for :genre
end
