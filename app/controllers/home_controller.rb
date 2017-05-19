# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @sliders = Slider.visible
    @collapsibles = Collapsible.usage_filtered("Home-Page")
    @card_groups = CardGroup.home_active
  end
end
