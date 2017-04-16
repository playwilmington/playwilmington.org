# frozen_string_literal: true

class PagesController < ApplicationController
  def show
    @page = Page.find_by_name(params[:name])
    @message = Message.new
    @testimonials = Testimonial.visable
  end

  def create_message
    @message = Message.new(message_params)

    if @message.valid?
      MessageMailer.new_message(@message).deliver
      redirect_to root_path, notice: "Your Message has been sent."
    else
      flash[:notice] = "An error occurred while delivering this message."
      redirect_to request.referer.to_s
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :email_to, :message)
  end
end
