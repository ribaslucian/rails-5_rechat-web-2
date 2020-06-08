class Researcher::MessagesController < Researcher::ResearcherController
  
  def index
    
    
    if params[:search]
      
      @messages = View::Message
      
      if !params[:interaction_name].nil? && params[:interaction_name] != ''
        @messages = @messages.where("
          interaction_name ~* '#{params[:interaction_name]}'
          OR reference_interaction_name ~* '#{params[:interaction_name]}'")
      end
      
      if !params[:content].nil? && params[:content] != ''
        @messages = @messages.where("content ~* '#{params[:content]}'")
      end
      
      if params[:types] != []
#        @messages = @messages.where(type_acronym_id: params[:types])
      end
    else
      @messages = View::Message
    end
    
    @messages = @messages.order(created_at: :desc).page params[:page]
  end
  
end
