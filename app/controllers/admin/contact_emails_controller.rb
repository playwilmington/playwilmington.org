# frozen_string_literal: true
module Admin
  class ContactEmailsController < AdminController
    before_action :set_contact_email, except: [:index, :new, :create]

    def index
      @q = ContactEmail.search(params[:q])
      @contact_emails = @q.result.page(params[:page])
    end

    def new
      @contact_email = ContactEmail.new
    end

    def show; end

    def create
      @contact_email = ContactEmail.new(contact_email_params)

      if @contact_email.save
        redirect_to admin_contact_emails_path,
                    notice: "Contact Email Created Successfully!"
      else
        render :new
      end
    end

    def edit; end

    def update
      if @contact_email.update(contact_email_params)
        redirect_to admin_contact_emails_path,
                    notice: "Contact Email Updated Successfully!"
      else
        render :edit
      end
    end

    def destroy
      @contact_email.destroy
      redirect_to admin_contact_emails_path,
                  notice: "Contact Email Deleted Successfully!"
    end

    private

    def set_contact_email
      @contact_email = ContactEmail.find(params[:id])
    end

    def contact_email_params
      params.require(:contact_email).permit(
        :page_id, :title, :email_address, :order, :active
      )
    end
  end
end
