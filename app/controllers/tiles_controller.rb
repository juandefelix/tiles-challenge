# require 'pry'

class TilesController < ApplicationController
  
  def index
    @tiles = Tile.ten_most_clicked
  end

  def create
    @tile = Tile.new(tile_params)
    @id = params[:tile][:id]
    # binding.pry

    respond_to do |format|
      if @tile.save
        format.html { redirect_to @tile, notice: 'Tile was successfully created.' }
        format.js { render "success" }
      else
        format.html { render action: 'new' }
        format.js { render action: 'exception' }
      end
    end
  end

  private
    def tile_params
      params.require(:tile).permit(:word, :timestamp)
    end
  end


Tile.distinct(:word).each do |w|
  puts "#{w}: #{Tile.where(word:w).count}"
end