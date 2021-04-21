class Character < ApplicationRecord
  belongs_to :user
  has_many :participations
  has_many :pieces, through: :participations