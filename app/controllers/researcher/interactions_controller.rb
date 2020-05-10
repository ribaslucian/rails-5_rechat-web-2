class Researcher::InteractionsController < Researcher::ResearcherController

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

    if @interaction.save!
      flash[:green] = 'Interação foi cadastrada, verifique na lista.'
      
      return redirect_to researcher_interactions_path
    else
      flash[:red] = 'Verifique o formulário e tente novamente.'
    end
    
    return render 'new'
  end
  
  def edit
    params.permit!
    @interaction = Interaction.find params[:id]
  end
  
  def update
    params.permit!
    @interaction = Interaction.find params[:interaction][:id]
    
#    @interaction.messages.each do |m|
#      if m.content
#        m.content = m.content.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
#      end
#    end
    
    if @interaction.update! params[:interaction]
      flash[:blue] = 'Interação foi editada, verifique na lista.'
      
      return redirect_to researcher_interactions_path
    else
      flash[:red] = 'Verifique o formulário e tente novamente.'
    end
    
    return render 'edit'
  end
  
  def destroy
    @interaction = Interaction.find(params[:id])
    @interaction.destroy
    
    flash[:blue] = 'Registro deletado com sucesso.'

    redirect_to researcher_interactions_path
  end
  
end
