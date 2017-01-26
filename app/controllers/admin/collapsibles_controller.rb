# frozen_string_literal: true
module Admin
  class CollapsiblesController < AdminController
    before_action :set_collapsible, except: [:index, :new, :create]

    def index
      @q = Collapsible.search(params[:q])
      @collapsibles = @q.result.page(params[:page])
    end

    def new
      @collapsible = Collapsible.new
    end

    def show; end

    def create
      @collapsible = Collapsible.new(collapsible_params)

      if @collapsible.save
        redirect_to admin_collapsibles_path,
                    notice: "Collapsible Created Successfully!"
      else
        render :new
      end
    end

    def edit; end

    def update
      if @collapsible.update(collapsible_params)
        redirect_to admin_collapsibles_path,
                    notice: "Collapsible Updated Successfully!"
      else
        render :edit
      end
    end

    def destroy
      @collapsible.destroy
      redirect_to admin_collapsibles_path,
                  notice: "Collapsible Deleted Successfully!"
    end

    private

    def set_collapsible
      @collapsible = Collapsible.find(params[:id])
    end

    def collapsible_params
      params.require(:collapsible).permit(
        :name, :active, :is_popout, :collapse_style, :usage_type, :order,
        :page_id, collapsible_items_attributes: [
          :id, :title, :body, :active, :icon, :order, :collapsible_id, :_destroy
        ]
      )
    end
  end
end
