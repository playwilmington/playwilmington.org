# frozen_string_literal: true

module Admin
  class SettingsController < AdminController
    before_action :set_setting

    def show; end

    def edit; end

    def update
      if @setting.update(setting_params)
        redirect_to admin_setting_path(@setting),
                    notice: "Settings Updated Successfully!"
      else
        render :edit
      end
    end

    private

    def set_setting
      @setting = Setting.find(params[:id])
    end

    def setting_params
      params.require(:setting).permit(
        :address, :company_name, :copyright, :email, :phone, :facebook_handle,
        :twitter_handle, :pinterest_handle, :instagram_handle, :donation_url,
        :calendar_help_text, :sign_in_registration_url
      )
    end
  end
end
