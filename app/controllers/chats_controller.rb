class ChatsController < ApplicationController
  def show
  	@messages = Message.all
    
    return d @messages
  end
end