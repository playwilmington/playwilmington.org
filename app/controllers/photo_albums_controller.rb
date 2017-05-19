# frozen_string_literal: true

class PhotoAlbumsController < ApplicationController
  def show
    @photo_album = PhotoAlbum.find(params[:id])
  end
end
