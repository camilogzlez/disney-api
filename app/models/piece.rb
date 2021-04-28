class Piece < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :participations
  has_many :characters, through: :participations
  has_one_attached :photo
end
