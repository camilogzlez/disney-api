json.extract! @character, :id, :name, :age, :weight, :history
json.participations @character.participations do |participation|
  json.extract! participation.piece, :id, :title, :category, :genre
end