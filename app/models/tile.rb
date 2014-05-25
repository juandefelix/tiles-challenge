class Tile
  include Mongoid::Document
  field :word
  field :timestamp, type: Time

  def self.ten_most_clicked
  #   tiles_ordered_by_count = Tile.distinct(:word).sort_by do |w| 
  #     Tile.where(word: w).count 
  #   end.reverse

    Tile.order_by(:distinct_word_count.desc).limit(10).sort_by do |w| 
      Tile.where(word: w.word).count 
    end.reverse
  end
end



# Count of Tiles with the same word
# Tile.where(word: "Photek").count

# Numbe of tiles with a distinct word
# Tile.distinct(:word)

# Match all people with last name Jordan and first name starting with d.
# Tile.where(last_name: "Jordan").and(first_name: /^d/i)

# Tile.desc(:first_name, :last_name)
  
# Tile.limit(10)