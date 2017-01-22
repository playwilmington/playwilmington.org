class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  skip_before_action :nav_links
  skip_before_action :alerts

  private

  def require_admin
    redirect_to root_path, notice: 'No Access' unless current_user.admin?
  end
end
