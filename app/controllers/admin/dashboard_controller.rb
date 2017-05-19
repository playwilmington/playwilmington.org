# frozen_string_literal: true

module Admin
  class DashboardController < AdminController
    def index
      @testimonials = Testimonial.dashboard.size
      @alerts = Alert.dashboard.size
      @pages = Page.dashboard.size
    end
  end
end
