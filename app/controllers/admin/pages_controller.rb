# frozen_string_literal: true
module Admin
  class PagesController < AdminController
    before_action :set_page, except: [:index, :new, :create]

    def index
      @q = Page.search(params[:q])
      @pages = @q.result.order(order: :asc).page(params[:page])
    end

    def new
      @page = Page.new
    end

    def show; end

    def create
      @page = Page.new(page_params)

      if @page.save
        redirect_to admin_pages_path, notice: "Page Created Successfully!"
      else
        render :new
      end
    end

    def edit; end

    def update
      if @page.update(page_params)
        redirect_to admin_pages_path, notice: "Page Updated Successfully!"
      else
        render :edit
      end
    end

    def destroy
      @page.destroy
      redirect_to admin_pages_path, notice: "Page Deleted Successfully!"
    end

    private

    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(
        :page_type, :title, :content, :icon, :page_id, :order, :name, :active,
        :show_calendar
      )
    end
  end
end
