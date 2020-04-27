class Voluntary::ChatsController < ApplicationController

  def private
    @contact = Contact.find params[:contact_id]
  end
  
end
