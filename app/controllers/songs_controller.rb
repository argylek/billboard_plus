# frozen_string_literal: true

class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_song, only: [:edit, :update, :destroy, :show]
  def index
    @songs = @artist.songs
  end

  def new
    @song = @artist.songs.new
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to artist_songs_path(@artist)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @song.update(song_params)
      redirect_to artist_songs_path(@artist)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to artist_songs_path
  end

  def show; end

  def new_song
    @billboard = Billboard.find(params[:billboard_id])
    @songs = Song.all.find(params[:id])
  end

  def add_song
    @billboard = Billboard.find(params[:billboard_id])
    @billboard.songs << Song.find(params[:id])
  end

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def song_params
    params.require(:song).permit(:name, :bpm)
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
