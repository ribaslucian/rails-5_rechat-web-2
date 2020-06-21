class Voluntary::ChatsController < Voluntary::VoluntaryController

  def private
    @contact = Contact.find params[:contact_id]
    
#    return d params[:contact_id]
    
    Contact.sql("UPDATE messages SET chat_open = TRUE WHERE contact_id = #{params[:contact_id]}")
  end
  
end
