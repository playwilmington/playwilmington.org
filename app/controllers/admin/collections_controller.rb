# frozen_string_literal: true

module Admin
  class CollectionsController < AdminController
    before_action :set_collection, except: %i[index new create]

    def index
      @q = Collection.search(params[:q])
      @collections = @q.result.page(params[:page])
    end

    def new
      @collection = Collection.new
    end

    def show; end

    def create
      @collection = Collection.new(collection_params)

      if @collection.save
        redirect_to admin_collections_path,
                    notice: "Collection Created Successfully!"
      else
        render :new
      end
    end

    def edit; end

    def update
      if @collection.update(collection_params)
        redirect_to admin_collections_path,
                    notice: "Collection Updated Successfully!"
      else
        render :edit
      end
    end

    def destroy
      @collection.destroy
      redirect_to admin_collections_path,
                  notice: "Collection Deleted Successfully!"
    end

    private

    def set_collection
      @collection = Collection.find(params[:id])
    end

    def collection_params
      params.require(:collection).permit(
        :title, :order, :icon, :link, :page_id, :active, :is_header
      )
    end
  end
end
