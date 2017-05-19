# frozen_string_literal: true

module Admin
  class CardGroupsController < AdminController
    before_action :set_card_group, except: %i[index new create]

    def index
      @q = CardGroup.search(params[:q])
      @card_groups = @q.result.page(params[:page])
    end

    def new
      @card_group = CardGroup.new
    end

    def show; end

    def create
      @card_group = CardGroup.new(card_group_params)

      if @card_group.save
        redirect_to admin_card_groups_path,
                    notice: "Card Group Created Successfully!"
      else
        render :new
      end
    end

    def edit; end

    def update
      if @card_group.update(card_group_params)
        redirect_to admin_card_groups_path,
                    notice: "Card Group Updated Successfully!"
      else
        render :edit
      end
    end

    def destroy
      @card_group.destroy
      redirect_to admin_card_groups_path,
                  notice: "Card Group Deleted Successfully!"
    end

    private

    def set_card_group
      @card_group = CardGroup.find(params[:id])
    end

    def card_group_params
      params.require(:card_group).permit(
        :page_id, :grid, :active, :order, :usage_type,
        cards_attributes: %i[
          id title card_content card_reveal order active size
          sticky_links btn_one_name btn_one_url btn_two_name
          btn_two_url card_group_id card_image toggle_title _destroy
        ]
      )
    end
  end
end
