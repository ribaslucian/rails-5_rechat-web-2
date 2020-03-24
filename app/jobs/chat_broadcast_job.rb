class ChatBroadcastJob < ApplicationJob
  queue_as :default

  # 1
  def perform(message)
    ActionCable.server.broadcast "chat_user_id_#{message.destiny_user_id}", message: render_message(message)
  end

  private
  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end