require 'faker'

module TilesHelper
  def self.words    
    cities = (1..8).map { |element| Faker::Address.city }
    countries = (1..8).map { |element| Faker::Address.country }
    names = (1..8).map {|element| Faker::Name.first_name }
    color = (1..8).map { |element| Faker::Commerce.color }
    latin = (1..8).map { |element| Faker::Lorem.word }
    bands = %w(pantera mudhoney nirvana metallica soundgarden korn slayer sepultura)
    beer_types = %w(bock wheat pilsen kolch stout porter pale brown)
    instruments = %w(guitar piano trumpet trombon sax bass drums voice)

    (cities + countries + names + color + latin + bands + beer_types + instruments).map(&:capitalize).shuffle
  end
end

p TilesHelper::words