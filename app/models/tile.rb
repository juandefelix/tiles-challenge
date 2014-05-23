class Tile
  include Mongoid::Document
  field :word
  field :timestamp, type: Time
end
