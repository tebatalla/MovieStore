# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = Movie.create([{ title: 'The Godfather', plot: 'Good movie' },
                       { title: 'Taxi Driver', plot: 'Vietnam vet goes a little crazy' },
                       { title: 'Interstellar', plot: 'Cool space movie' }])

User.create(nickname: 'Al', email: 'al@godfather.com', password: 'password')

movies.each do |movie|
  PurchaseOption.create(price: '2.99', quality: 'HD', movie: movie)
end
