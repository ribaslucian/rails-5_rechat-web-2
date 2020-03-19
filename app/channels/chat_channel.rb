class ChatChannel < ApplicationCable::Channel
  
  # 1
  def subscribed
    stream_from "chat_#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # 1
  def speak data
  	Message.create! content: data['message'], room: data['room']
  end
end