class HomeController < ApplicationController
  def index
    @sliders = Slider.visable
  end
end
