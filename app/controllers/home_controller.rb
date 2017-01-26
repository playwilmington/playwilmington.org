# frozen_string_literal: true
class HomeController < ApplicationController
  def index
    @sliders = Slider.visable
    @collapsibles = Collapsible.usage_filtered("Home-Page")
  end
end
