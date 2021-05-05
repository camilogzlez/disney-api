

json.array! @pieces do |piece|
  json.extract! piece, :id, :title, :creation_date
  json.extract! piece.photo, :url
end