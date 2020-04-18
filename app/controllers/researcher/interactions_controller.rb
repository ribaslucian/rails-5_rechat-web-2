class Researcher::InteractionsController < ApplicationController

  def index
    @interactions = Interaction.all
  end
  
  def new
    @interaction = Interaction.new
    @interaction.messages.build
    
#    return d @interaction.messages
  end
  
  def create
    
    params.permit!
    @interaction = Interaction.new params[:interaction]
    
    if @interaction.save
      flash[:black] = {
        title: 'Sucesso!',
        content: 'Interação foi cadastrada, verifique na lista.',
      }
      
      return redirect_to '/researcher/interactions'
    else
      return d 'oi'
      flash[:black] = {
        title: 'Opa, algo deu errado.',
        content: 'Verifique o formulário e tente novamente.',
      }
    end
    
    return render 'new'
  end
  
end
