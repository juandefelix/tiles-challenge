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
        format.html { redirect_to root_path }
        format.js { render "alert('Hello Rails');" }
    end
  end

  private
    def tile_params
      params.require(:tile).permit(:word, :timestamp)
    end
  end


# @id = params[:tile][:id]