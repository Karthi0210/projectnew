class MessagesController < ApplicationController
  before_action :require_user

  def create
    @message = Message.new(message_params)
    @message.author = current_author
    if @message.save
      ActionCable.server.broadcast 'chatroom_channel',  message: render_message(@message), author: @message.author.authorname
    else
      render 'chatrooms/show'
    end    
  end
  
  private
  
  def message_params
    params.require(:message).permit(:content)
  end

  def render_message(message)
    render(partial: 'message', locals: { message: message } )
  end
end