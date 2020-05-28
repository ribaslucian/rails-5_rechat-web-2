class Researcher::InteractionsController < Researcher::ResearcherController
  
  def start
    i = Interaction.find(params[:id])
    
    first_message = i.messages.order(:id).first
    
    # pegar a primeira parada para aguardar resposta
    message_wait = Message
    .select(:id)
    .order(:id)
    .limit(1)
    .where(type_acronym_id: 5)
    .where(interaction_id: i.id)
    .where("id > #{first_message.id}")
    .first()
    
    
    # buscar todoas as mensagens da interacao ate aguarda a resposta
    messages = Message.order(:id)
    .where("id >= #{first_message.id} AND id < #{message_wait.id}")
    .where('origin_user_id IS NULL AND destiny_user_id IS NULL')
    .where(interaction_id: i.id)
    
    User.where(type_acronym_id: 201).each do |u|
      offset = rand(u.contacts.count)
      
      messages.each do |m|
        Message.create!({
            origin_user_id: 0,
            destiny_user_id: u.id,
            content: m.content,
            interaction_id: i.id,
            interaction_ids: m.interaction_ids,
            # interaction_message_id: message.id,
            type_acronym_id: m.type_acronym_id,
            type_content_acronym_id: m.type_content_acronym_id,
            contact_id: Contact.where(user_id: u.id).offset(offset).first.id
          })
      end
    end
    
    
    flash[:green] = 'Bot iniciado para todos os voluntários.'
    
    return redirect_to researcher_interactions_path
  end

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
      flash[:green] = 'Bot foi cadastrado, verifique na lista.'
      
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
      flash[:blue] = 'Bot foi editado, verifique na lista.'
      
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
