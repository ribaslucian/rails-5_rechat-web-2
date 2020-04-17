class ChatBroadcastJob < ApplicationJob
  queue_as :default

  # 1
  def perform(message)
    html = render_message(message)
    
    ActionCable.server.broadcast "chat_user_id_#{message.origin_user_id}",
      message_html: html,
      message_record: message
    
    ActionCable.server.broadcast "chat_user_id_#{message.destiny_user_id}",
      message_html: html,
      message_record: message
  end

  private
  
  def render_message(message)
    ApplicationController.renderer.render(
      partial: 'researcher/messages/message',
      locals: { message: message }
    )
  end
end