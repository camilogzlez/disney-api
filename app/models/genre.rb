class Genre < ApplicationRecord
  has_many :pieces
  accepts_nested_attributes_for :pieces

  include PgSearch::Model

  # multisearchable against: [:title ]

end
