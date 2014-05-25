# require 'pry'

class TilesController < ApplicationController
  
  def index
    @tiles = Tile.ten_most_clicked
  end

  def create
    word = params[:tile][:word]
    timestamp = params[:tile][:timestamp]
    
    MongoWorker.perform_async(word, timestamp)
    
    respond_to do |format|
      # if @tile.save
        format.html { redirect_to @tile, notice: 'Tile was successfully created.' }
        format.js { render "success" }
      # else
      #   format.html { render action: 'new' }
      #   format.js { render action: 'exception' }
      # end
    end
  end

  private
    def tile_params
      params.require(:tile).permit(:word, :timestamp)
    end
  end


# @id = params[:tile][:id]