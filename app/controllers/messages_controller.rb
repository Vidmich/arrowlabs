class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    if params[:commit]
      @message = Message.new(params[:message])
      if @message.save

        MessageMailer.new_message_notification(@message).deliver

        redirect_to root_url, :notice => 'Message sent successfully, we will get back to you within 24 hours'
      else
        flash.now[:error] = "Required fields are missing or invalid"
        render 'welcome/index'
      end
    else
      redirect_to :back
    end
  end
end
