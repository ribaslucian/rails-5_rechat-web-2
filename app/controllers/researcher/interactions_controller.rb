class Researcher::InteractionsController < ApplicationController

  def index
  end
  
  def new
    @interaction = Interaction.new
    @interaction.messages.build
    
#    return d @interaction.messages
  end
  
end
