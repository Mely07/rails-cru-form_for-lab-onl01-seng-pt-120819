class SongsController < ApplicationController
    def index 
        @songs = Song.all
    end

    def show
        @song= Song.find(params[:id])
    end

    def new 
        @song = Song.new
    end

    def create
      #@song= Song.create(name: params[:song][:name], artist_id: params[:song][:artist_id], genre_id: params[:song][:genre_id] )
      @song = Song.create(song_params)
      redirect_to song_path(@song)
    end

    def update
        @song = Song.find(params[:id])
        @song.update(song_params)
        redirect_to song_path(@song)
    end

    def edit
      @song = Song.find(params[:id])
    end

private

    def song_params
      params.require(:song).permit(:name, :artist_id, :genre_id)
    end


end
