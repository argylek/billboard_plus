class BillboardsController < ApplicationController
  before_action :set_billboard, only: [:show, :edit, :update, :destroy, :remove_song]

  def index
    @billboards = current_user.billboards
  end

  def new
    @billboard = current_user.billboards.new
  end

  def create
    @billboard = current_user.billboards.new(billboard_params)
    if @billboard.save
      redirect_to billboards_path
    else
      render :new
    end
  end

  def show
    @songs = @billboard.songs
  end

  def edit
  end

  def update
    if @billboard.update(billboard_params)
      redirect_to billboards_path
    else
      render :edit
    end
  end

  def destroy
    @billboard.destroy
    redirect_to billboards_path
  end

  def new_song
    @billboard = Billboard.find(params[:id])
    @songs = Song.all.where(billboard_id: nil)
  end

  def add_song
    @billboard = Billboard.find(params[:id])
    @billboard.songs << Song.find(params[:song_id])
    redirect_to billboard_path(@billboard)
  end

  def remove_song
    Song.find(params[:song_id]).update(billboard_id: nil)
    redirect_to billboard_path(@billboard)
  end

  private

  def set_billboard
    @billboard = current_user.billboards.find(params[:id])
  end

  def billboard_params
    params.require(:billboard).permit(:name, :region, :song_id, :artist_id)
  end

end
