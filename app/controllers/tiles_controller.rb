class TilesController < ApplicationController
  
  def index
    @tiles = Tile.ten_most_clicked
  end

  def create
    # debugger
    @id = params[:tile][:id]
    begin
      word = params[:tile][:word]
      timestamp = params[:tile][:timestamp]
      

      MongoWorker.perform_async(word, timestamp)
      raise if rand(10) == 7
      respond_to do |format|
          format.js { render text: "Success".to_json }
      end
    rescue
      respond_to do |format|
          format.js { render "exception" }
      end
    end
  end

  private
    def tile_params
      params.require(:tile).permit(:word, :timestamp)
    end
  end

