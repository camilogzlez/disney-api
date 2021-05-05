json.extract! @piece, :id, :category, :title, :creation_date, :rating, :genre
json.participations @piece.participations do |participation|
  json.extract! participation.character, :name
end