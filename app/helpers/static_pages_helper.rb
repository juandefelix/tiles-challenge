require 'faker'

module StaticPagesHelper
  def self.words    
    names = (1..8).map {|element| Faker::Name.first_name }
    colors = (1..8).map { |element| Faker::Commerce.color }
    latin = (1..8).map { |element| Faker::Lorem.word }

    cities = %w(madrid  chicago paris     rome
                calgary jalisco amsterdam barcelona
                athens  oslo    bahia     reno
                ).sample(8)

    countries = %w(spain  usa    france  italy
                   canada mexico belgium sweden
                   greece norway brazil  andorra
                   ).sample(8)

    bands = %w(pantera     mudhoney nirvana  metallica 
               soundgarden korn     slayer   sepultura
               megadeth    r.a.t.m. r.h.c.p. anthrax   
               ).sample(8)

    beer_types = %w(bock       wheat   pilsen kolch 
                    stout      porter  pale   brown
                    dopplebock maerzen scotch alt
                    ).sample(8)

    instruments = %w(guitar   piano  trumpet trombon 
                     sax      bass   drums   voice
                     clarinet basson oboe    marimba
                     ).sample(8)

    (cities + countries + names + colors + latin + bands + beer_types + instruments).map(&:upcase).shuffle
  end
end
