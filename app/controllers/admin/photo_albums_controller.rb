# frozen_string_literal: true
module Admin
  class PhotoAlbumsController < AdminController
    before_action :set_photo_album, except: [:index, :new, :create]

    def index
      @q = PhotoAlbum.search(params[:q])
      @photo_albums = @q.result.page(params[:page])
    end

    def new
      @photo_album = PhotoAlbum.new
    end

    def show; end

    def create
      @photo_album = PhotoAlbum.new(photo_album_params)

      if @photo_album.save
        redirect_to admin_photo_albums_path,
                    notice: "Photo Album Created Successfully!"
      else
        render :new
      end
    end

    def edit; end

    def update
      if @photo_album.update(photo_album_params)
        redirect_to admin_photo_albums_path,
                    notice: "Photo Album Updated Successfully!"
      else
        render :edit
      end
    end

    def destroy
      @photo_album.destroy
      redirect_to admin_photo_albums_path,
                  notice: "Photo Album Deleted Successfully!"
    end

    private

    def set_photo_album
      @photo_album = PhotoAlbum.find(params[:id])
    end

    def photo_album_params
      params.require(:photo_album).permit(:title, :order, :page_id, :active)
    end
  end
end
