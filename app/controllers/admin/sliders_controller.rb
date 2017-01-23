module Admin
  class SlidersController < AdminController
    before_action :set_slider, except: [:index, :new, :create]

    def index
      @q = Slider.search(params[:q])
      @sliders = @q.result.page(params[:page])
    end

    def new
      @slider = Slider.new
    end

    def show; end

    def create
      @slider = Slider.new(slider_params)

      if @slider.save
        redirect_to admin_sliders_path, notice: 'Slider Created Successfully!'
      else
        render :new
      end
    end

    def edit; end

    def update
      if @slider.update(slider_params)
        redirect_to admin_sliders_path, notice: 'Slider Updated Successfully!'
      else
        render :edit
      end
    end

    def destroy
      @slider.destroy
      redirect_to admin_sliders_path, notice: 'Slider Deleted Successfully!'
    end

    private

    def set_slider
      @slider = Slider.find(params[:id])
    end

    def slider_params
      params.require(:slider).permit(
        :subtitle, :title, :position, :photo, :active, :order
      )
    end
  end
end
