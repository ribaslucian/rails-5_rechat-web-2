class Researcher::MessagesController < Researcher::ResearcherController
  
  def index
    @messages = View::Message.page params[:page]
  end
  
end
