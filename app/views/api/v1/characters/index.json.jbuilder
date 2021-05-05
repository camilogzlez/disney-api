json.array! @characters do |character|
  json.extract! character, :id, :name
  json.extract! character.photo, :url
end