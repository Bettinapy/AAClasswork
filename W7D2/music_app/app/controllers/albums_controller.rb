class AlbumsController < ApplicationController
    def show 
        @album = Album.find(params[:id])
        render :show
    end

    def new 
        @bands = Band.all
        @album = Album.new
        render :new
    end

    def create 
        @album = Album.new(album_params)
        if @album.save
            redirect_to album_url(@album)
        else 
            flash[:errors] = @album.errors.full_messages 
            redirect_to new_band_album_url(@album.band_id)
        end
    end

    def edit 
        @bands = Band.all
        @album = Album.find(params[:id])
        render :edit
    end

    def update 
        @album = Album.find(params[:id])
        if @album.update_attributes(album_params)
            redirect_to album_url(@album)
        else 
            flash.now[:errors] = @album.errors.full_messages 
            render :edit
        end
    end

    def destroy 
        @album = Album.find(params[:id])
        @album.destroy
        redirect_to bands_url
    end

    def album_params 
        params.require(:album).permit(:title, :year, :band_id, :music_type)
    end
end