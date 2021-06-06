class Character < ApplicationRecord
  belongs_to :user
  has_many :participations, dependent: :destroy
  has_many :pieces, through: :participations
  has_one_attached :photo

  
  include PgSearch::Model

  scope :filter_by_age, -> (age) { where("age like ?", "#{age}%")}
  scope :filter_by_weight, -> (weight) { where("weight like ?", "#{weight}%")}
  scope :filter_by_piece, -> (piece) { where("piece.title like ?", "#{piece}%")}

  pg_search_scope :search_by_name, against: [:name],
    using: {
      tsearch: {
        any_word: true,
        prefix: true
      }
    }



end