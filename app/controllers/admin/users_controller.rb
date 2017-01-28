# frozen_string_literal: true
module Admin
  class UsersController < AdminController
    before_action :set_user, only: [:update, :destroy]

    def index
      @q = User.search(params[:q])
      @users = @q.result.page(params[:page])
    end

    def update
      @user.update(user_params)
      redirect_to admin_users_path, notice: "User Updated Successfully!"
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path, notice: "User Deleted Successfully!"
    end

    private

    def set_user
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit(:admin)
    end
  end
end
