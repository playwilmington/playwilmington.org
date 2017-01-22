module Admin
  class AlertsController < AdminController
    before_action :set_alert, except: [:index, :new, :create]

    def index
      @q = Alert.search(params[:q])
      @alerts = @q.result.page(params[:page])
    end

    def new
      @alert = Alert.new
    end

    def show; end

    def create
      @alert = Alert.new(alert_params)

      if @alert.save
        redirect_to admin_alerts_path, notice: 'Alert Created Successfully!'
      else
        render :new
      end
    end

    def edit; end

    def update
      if @alert.update(alert_params)
        redirect_to admin_alerts_path, notice: 'Alert Updated Successfully!'
      else
        render :edit
      end
    end

    def destroy
      @alert.destroy
      redirect_to admin_alerts_path, notice: 'Alert Deleted Successfully!'
    end

    private

    def set_alert
      @alert = Alert.find(params[:id])
    end

    def alert_params
      params.require(:alert).permit(
        :name, :title, :content, :start_date, :end_date, :active
      )
    end
  end
end
