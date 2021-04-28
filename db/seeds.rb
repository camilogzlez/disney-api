# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "open-uri"

Character.destroy_all
Piece.destroy_all
Participation.destroy_all
User.destroy_all
Genre.destroy_all


puts "Creating two users"

camilo = User.create!(email: "camilogzlez@gmail.com", password: "camilogzlez")
camilo.save!

marcela = User.create!(email: "grimaldosmariamarcela@gmail.com", password: "grimaldosmariamarcela")
marcela.save!

puts "Creating two characters"

goofy = Character.create!(name: "goofy", age: 70, weight: 120, history:  "Goofy is a funny animal cartoon character created in 1932 at Walt Disney Animation Studios. Goofy is a tall, anthropomorphic dog who typically wears a turtle neck and vest, with pants, shoes, white gloves, and a tall hat originally designed as a rumpled fedora. Goofy is a close friend of Mickey Mouse and Donald Duck. He is normally characterized as hopelessly clumsy and dim-witted, yet this interpretation is not always definitive; occasionally Goofy is shown as intuitive and clever, albeit in his own unique, eccentric way.", user: camilo)
goofy.photo.attach(io: open("https://static.wikia.nocookie.net/disney/images/e/e5/Goofy.png/revision/latest/top-crop/width/360/height/450?cb=20140306174418&path-prefix=es"), filename: "goofy.png", content_type: "image/jpeg")
goofy.save!

mcduck = Character.create!(name: "mcduck", age: 100, weight: 70, history:  "Scrooge is an elderly Scottish anthropomorphic Pekin duck with a yellow-orange bill, legs, and feet. He typically wears a red or blue frock coat, top hat, pince-nez glasses, and spats. He is portrayed in animation as speaking with a Scottish accent. Originally intended to be used only once, Scrooge became one of the most popular characters in Disney comics, and Barks's signature work.", user: marcela)
mcduck.photo.attach(io: open("https://upload.wikimedia.org/wikipedia/en/5/54/Scrooge_McDuck.png"), filename: "McDuck.png", content_type: "image/jpeg")
mcduck.save!

puts "Creating five genres"
drama = Genre.create!(title: "Drama")
drama.save!
action = Genre.create!(title: "Action")
action.save!
terror = Genre.create!(title: "Terror")
terror.save!
fantasy = Genre.create!(title: "Fantasy")
fantasy.save!
comedy = Genre.create!(title: "Comedy")
comedy.save!


puts "Creating three pieces"
Trail_of_the_Unicorn = Piece.create!(category: "Movie", title: "Trail of the Unicorn", creation_date: Date.new(1950, 02, 1), rating: 4, user: marcela, genre: comedy)
Trail_of_the_Unicorn.photo.attach(io: open("https://chasemagnett.files.wordpress.com/2014/06/barks-cover.jpg?w=768"), filename: "Trail_of_the_Unicorn.png", content_type: "image/jpeg")
Trail_of_the_Unicorn.save!

duck_tales = Piece.create!(category: "Series", title: "Duck Tales", creation_date: Date.new(1987, 9, 18), rating: 5, user: marcela, genre: comedy)
duck_tales.photo.attach(io: open("https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/DuckTales_TV_logo.svg/375px-DuckTales_TV_logo.svg.png"), filename: "duck_tales.png", content_type: "image/jpeg")
duck_tales.save!

a_goofy_movie = Piece.create!(category: "Movie", title: "A Goofy Movie", creation_date: Date.new(1995, 1, 15), rating: 5, user: camilo, genre: action)
a_goofy_movie.photo.attach(io: open("https://images-na.ssl-images-amazon.com/images/I/818218V60OL._SL1200_.jpg"), filename: "a_goofy_movie.png", content_type: "image/jpeg")
a_goofy_movie.save!

puts "Creating three participations"

participation_1 = Participation.create!(character: mcduck, piece: Trail_of_the_Unicorn)
participation_1.save!

participation_2 =Participation.create!(character: mcduck, piece: duck_tales)
participation_2.save!

participation_3 =Participation.create!(character: goofy, piece: a_goofy_movie)
participation_3.save!

puts "seeds created"