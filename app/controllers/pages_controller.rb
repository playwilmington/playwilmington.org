# frozen_string_literal: true
class PagesController < ApplicationController
  def show
    @page = Page.find_by_name(params[:name])
  end
end
