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
      flash[:green] = 'Interação foi cadastrada, verifique na lista.'
      
      return redirect_to researcher_interactions_path
    else
      flash[:red] = 'Verifique o formulário e tente novamente.'
    end
    
    return render 'new'
  end
  
  def destroy
    @article = Interaction.find(params[:id])
    @article.destroy
    
    flash[:blue] = 'Registro deletado com sucesso.'

    redirect_to researcher_interactions_path
  end
  
  
  #def update
  #  @article = Article.find(params[:id])
  #
  #  if @article.update(article_params)
  #    redirect_to @article
  #  else
  #    render 'edit'
  #  end
  #end
  
end
