module TilesHelper
  def votes_of(tile)
    Tile.where(word: tile.word).count
  end
end
