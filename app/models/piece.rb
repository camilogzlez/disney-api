class Piece < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :participations, dependent: :destroy
  has_many :characters, through: :participations
  has_one_attached :photo
  accepts_nested_attributes_for :genre

  include PgSearch::Model
  
  scope :filter_by_genre, -> (genre) { where("piece.genre like ?", "#{genre}%")}

    pg_search_scope :search_by_title, against: [:title],
    using: {
      tsearch: {
        any_word: true,
        prefix: true
      }
    }

end
