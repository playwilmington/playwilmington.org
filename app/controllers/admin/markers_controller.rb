# frozen_string_literal: true
module Admin
  class MarkersController < AdminController
    before_action :set_marker, except: [:index, :new, :create]

    def index
      @q = Marker.search(params[:q])
      @markers = @q.result.page(params[:page])
    end

    def new
      @marker = Marker.new
    end

    def show; end

    def create
      @marker = Marker.new(marker_params)

      if @marker.save
        redirect_to admin_markers_path, notice: "Marker Created Successfully!"
      else
        render :new
      end
    end

    def edit; end

    def update
      if @marker.update(marker_params)
        redirect_to admin_markers_path, notice: "Marker Updated Successfully!"
      else
        render :edit
      end
    end

    def destroy
      @marker.destroy
      redirect_to admin_markers_path, notice: "Marker Deleted Successfully!"
    end

    private

    def set_marker
      @marker = Marker.find(params[:id])
    end

    def marker_params
      params.require(:marker).permit(
        :address, :title, :body, :marker_type, :page_id
      )
    end
  end
end
