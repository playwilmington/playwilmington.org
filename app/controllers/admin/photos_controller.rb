# frozen_string_literal: true

module Admin
  class PhotosController < AdminController
    before_action :set_photo_album

    def new
      @photo = Photo.new
    end

    def create
      @photo = Photo.new(photo_params)
      @photo.image = params[:photo][:image]

      if @photo.save
        redirect_to admin_photo_albums_path,
                    notice: "Photos Created Successfully!"
      else
        render :new
      end
    end

    private

    def set_photo_album
      @photo_album = PhotoAlbum.find(params[:photo_album_id])
    end

    def photo_params
      params.require(:photo).permit(:image).merge(
        photo_album_id: @photo_album.id
      )
    end
  end
end
