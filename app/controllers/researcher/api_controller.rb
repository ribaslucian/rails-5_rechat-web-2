class Researcher::ApiController < ApplicationController

  
  # view: researcher/messages/message, data: { message: message }
  # view, data
  def render
    puts 'ola'
    return 
    
    puts ApplicationController.renderer.render(
      partial: view,
      locals: data
    )
    
    return
  end
  
end
