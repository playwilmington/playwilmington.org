# frozen_string_literal: true

class TestimonialsController < ApplicationController

  def new
    @testimonial = Testimonial.new
  end

  def create
    @testimonial = Testimonial.new(testimonial_params)

    if @testimonial.save
      redirect_to root_path, notice: "Testimonial Created Successfully!"
    else
      render :new
    end
  end

  private

  def testimonial_params
    params.require(:testimonial).permit(:name, :quote)
  end
end
