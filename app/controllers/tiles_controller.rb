require 'pry'

class TilesController < ApplicationController
  include TilesHelper

  # before_action :set_tile, only: [:show, :edit, :update, :destroy]

  # GET /tiles
  # GET /tiles.json
  def index
    # binding.pry
    @tiles = TilesHelper::words
  end

  # GET /tiles/1
  # GET /tiles/1.json
  def show
  end

  # GET /tiles/new
  # def new
  #   @tile = Tile.new
  # end

  # GET /tiles/1/edit
  # def edit
  # end

  # POST /tiles
  # POST /tiles.json
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

  # PATCH/PUT /tiles/1
  # PATCH/PUT /tiles/1.json
  # def update
  #   respond_to do |format|
  #     if @tile.update(tile_params)
  #       format.html { redirect_to @tile, notice: 'Tile was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @tile.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /tiles/1
  # DELETE /tiles/1.json
  # def destroy
  #   @tile.destroy
  #   respond_to do |format|
  #     format.html { redirect_to tiles_url }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_tile
    #   @tile = Tile.find(params[:id])
    # end

     def tile_params
      params.require(:tile).permit(:word, :timestamp)
    end
  end
