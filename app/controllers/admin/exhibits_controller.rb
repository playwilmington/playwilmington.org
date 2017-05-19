# frozen_string_literal: true

module Admin
  class ExhibitsController < AdminController
    before_action :set_exhibit, except: %i[index new create]

    def index
      @q = Exhibit.search(params[:q])
      @exhibits = @q.result.page(params[:page])
    end

    def new
      @exhibit = Exhibit.new
    end

    def show; end

    def create
      @exhibit = Exhibit.new(exhibit_params)

      if @exhibit.save
        redirect_to admin_exhibits_path,
                    notice: "Exhibit Created Successfully!"
      else
        render :new
      end
    end

    def edit; end

    def update
      if @exhibit.update(exhibit_params)
        redirect_to admin_exhibits_path,
                    notice: "Exhibit Updated Successfully!"
      else
        render :edit
      end
    end

    def destroy
      @exhibit.destroy
      redirect_to admin_exhibits_path,
                  notice: "Exhibit Deleted Successfully!"
    end

    private

    def set_exhibit
      @exhibit = Exhibit.find(params[:id])
    end

    def exhibit_params
      params.require(:exhibit).permit(
        :page_id, :title, :description, :order, :active, :icon
      )
    end
  end
end
