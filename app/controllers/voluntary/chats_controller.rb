class Voluntary::ChatsController < Voluntary::VoluntaryController

  def private
    @contact = Contact.find params[:contact_id]
  end
  
end
