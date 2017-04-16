# frozen_string_literal: true

module Admin
  class TestimonialsController < AdminController
    before_action :set_testimonial, except: %i[index new create]

    def index
      @q = Testimonial.search(params[:q])
      @testimonials = @q.result.page(params[:page])
    end

    def new
      @testimonial = Testimonial.new
    end

    def show; end

    def create
      @testimonial = Testimonial.new(testimonial_params)

      if @testimonial.save
        redirect_to admin_testimonials_path,
                    notice: "Testimonial Created Successfully!"
      else
        render :new
      end
    end

    def edit; end

    def update
      if @testimonial.update(testimonial_params)
        redirect_to admin_testimonials_path,
                    notice: "Testimonial Updated Successfully!"
      else
        render :edit
      end
    end

    def destroy
      @testimonial.destroy
      redirect_to admin_testimonials_path,
                  notice: "Testimonial Deleted Successfully!"
    end

    private

    def set_testimonial
      @testimonial = Testimonial.find(params[:id])
    end

    def testimonial_params
      params.require(:testimonial).permit(
        :name, :quote, :status
      )
    end
  end
end
