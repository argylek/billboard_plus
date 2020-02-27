# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@billboard = ['Top 100', 'Top 50']
regions = ['US', 'EU', 'Country-Western', 'Rock', 'Pop', 'Folk', 'Electronica']


regions.each do |regions|
  User.first.billboards.create(name: @billboard.sample, region:regions)
end

10.times do |i|
  artist = User.first.artists.create(name: Faker::Music.band, genre:Faker::Music.genre)
  5.times do |s|
    artist.songs.create(name: Faker::Music::UmphreysMcgee.song, bpm: Faker::Number.number(digits: 3))
  end
end

p 'seeded properly'
