  class TilesController < ApplicationController
  
  def index
    @tiles = Tile.ten_most_clicked
  end

  def create
    @id = params[:tile][:id]
    word = params[:tile][:word]
    timestamp = params[:tile][:timestamp]

    begin  
      MongoWorker.perform_async(word, timestamp)
      raise "Random exception" if rand(10) == 7
      respond_to do |format|
          format.js { render text: "Success".to_json }
      end
    rescue Exception => e  
      puts e.message  
      puts e.backtrace 
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

