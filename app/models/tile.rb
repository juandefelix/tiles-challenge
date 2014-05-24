class Tile
  include Mongoid::Document
  field :word
  field :timestamp, type: Time

  def self.ten_most_clicked
    tiles_ordered_by_count = Tile.distinct(:word).sort_by do |w| 
      Tile.where(word: w).count 
    end.reverse

    tiles_ordered_by_count.first(10)
  end
end


=begin
  
Tile.where(name: "Photek").count

Tile.distinct(:word)

# Match all people with last name Jordan and first name starting with d.
Tile.where(last_name: "Jordan").and(first_name: /^d/i)

Tile.desc(:first_name, :last_name)
  
Tile.limit(10)



=end