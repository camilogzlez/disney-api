class Piece < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :participations
  has_many :characters, through: :participations
end
