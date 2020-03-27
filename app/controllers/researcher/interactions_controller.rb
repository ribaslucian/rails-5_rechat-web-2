class Researcher::InteractionsController < ApplicationController

  def index
  end
  
  def new
    @interaction = Interaction.new
  end
  
end
