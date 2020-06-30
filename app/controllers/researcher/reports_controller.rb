class Researcher::ReportsController < Researcher::ResearcherController

  layout 'print'
  
  def users
    
  end
  
  
  def bots
    
  end
  
  
  def messages
    @messages = View::Message.all.order(created: :desc)
  end
  
end
