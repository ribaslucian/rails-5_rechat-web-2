class Message < ApplicationRecord
  # 1
  after_create_commit { broadcast_if_raw_message }
  after_create :start_interaction
  before_save :translate_and_calc_sentimental
  
  belongs_to :interaction, optional: true
  belongs_to :contact, optional: true
  
  belongs_to :origin_user, class_name: 'User', foreign_key: :origin_user_id, optional: true
  belongs_to :destiny_user, class_name: 'User', foreign_key: :destiny_user_id, optional: true
  belongs_to :previous_message, class_name: 'User', foreign_key: :previous_message_id, optional: true
  
  def start_interaction
    if self.destiny_user_id == 0
    
      # selecionar a ultima mensagem enviada de uma interacao
      last_message = Message.order('id DESC, interaction_ids DESC')
      .where("interaction_id IS NOT NULL AND destiny_user_id = 2")
      .limit(1)
      .first

      # verificar se existe uma mensagem de interacao ja iniciada
      if !last_message.nil?
        puts "\n ------------------ \n"
        
        # antes precisamos ver se a ultima mensagm enviada é a ultima da interacao em questao
        last_message_interaction = Message
        .where(interaction_id: last_message.interaction_id)
        .where('origin_user_id IS NULL')
        .where('destiny_user_id IS NULL')
        .order(interaction_ids: :desc)
        .limit(1)
        .first()

        if (last_message_interaction.interaction_ids == last_message.interaction_ids)
          start_or_notify()
        else
          continue_interaction last_message
        end

      else
        start_or_notify()
      end      
    end
  end
  
  def continue_interaction last_message
    # obter a proxima mensagem a enviar
    next_message = Message
    .where(interaction_id: last_message.interaction_id)
    .where(interaction_ids: last_message.interaction_ids + 1)
    .where('origin_user_id IS NULL AND destiny_user_id IS NULL')
    .where(interaction_id: last_message.interaction_id)
    .first()
      
    # pegar a primeira parada para aguardar resposta
    message_wait = Message
    .order(:id)
    .limit(1)
    .where(type_acronym_id: 5)
    .where(interaction_id: last_message.interaction_id)
    .where("id > #{next_message.id}")
    .first()
      
    # buscar todas as mensagens da interacao ate aguarda a resposta
    if !message_wait.nil?
      messages = Message.order(:id)
      .where("id >= #{next_message.id} AND id < #{message_wait.id}")
      .where('origin_user_id IS NULL AND destiny_user_id IS NULL')
      .where(interaction_id: last_message.interaction_id)
    else
      messages = Message.order(:id)
      .where("id >= #{next_message.id}")
      .where('origin_user_id IS NULL AND destiny_user_id IS NULL')
      .where(interaction_id: last_message.interaction_id)
    end
      
    messages.each do |m|
      Message.create!({
          origin_user_id: 0,
          destiny_user_id: 2,
          content: m.content,
          interaction_id: m.interaction_id,
          interaction_ids: m.interaction_ids,
          type_acronym_id: m.type_acronym_id,
          type_content_acronym_id: m.type_content_acronym_id
        })
    end
  end
  
  def start_or_notify
    # iniciar uma interacao
    if self.content == 'start'

      i = Interaction.all.select(:id).first()

      # pegar a primeira mensagem da interacao a enviar
      message = Message.order(id: :asc).find_by_interaction_id(i.id)
          
      # pegar a primeira parada para aguardar resposta
      message_wait = Message
      .select(:id)
      .order(:id)
      .limit(1)
      .where(type_acronym_id: 5)
      .where(interaction_id: message.interaction_id)
      .where("id > #{message.id}")
      .first()
      
      # buscar todoas as mensagens da interacao ate aguarda a resposta
      messages = Message.order(:id)
      .where("id >= #{message.id} AND id < #{message_wait.id}")
      .where('origin_user_id IS NULL AND destiny_user_id IS NULL')
      .where(interaction_id: message.interaction_id)

      messages.each do |m|
        Message.create!({
            origin_user_id: 0,
            destiny_user_id: 2,
            content: m.content,
            interaction_id: i.id,
            interaction_ids: m.interaction_ids,
            # interaction_message_id: message.id,
            type_acronym_id: m.type_acronym_id,
            type_content_acronym_id: m.type_content_acronym_id
          })
      end

    else
      # nenhuma interacao em vigor
      Message.create!({
          origin_user_id: 0,
          destiny_user_id: 2,
          content: 'Oi! <br/> Não posso lhe responder no momento mas assim que possível entro em contato.'
        })
    end
  end

  def broadcast_if_raw_message
    if !self.origin_user_id.nil? && !self.destiny_user_id.nil?
      ChatBroadcastJob.perform_later self
    end
  end

  def translate_and_calc_sentimental
    if self.type_acronym_id == 2 && self.type_content_acronym_id == 50
      self.content_en = %x(python scripts/translate.py "#{self.content}")
      
      analyzer = Sentimental.new
      analyzer.load_defaults
      self.sentimental_category = analyzer.sentiment self.content
      self.sentimental_score = analyzer.score self.content
    end
  end

  def self.seed_test
    Message.create!({
        origin_user_id: 2,
        destiny_user_id: 1,
        content: "Gostaria de enfatizar que o acompanhamento das preferências de consumo assume importantes posições no estabelecimento dos métodos utilizados na avaliação de resultados.",
        contact_id: 1
      })
    
    Message.create!({
        origin_user_id: 2,
        destiny_user_id: 1,
        type_content_acronym_id: 51,
        content: "https://www.infoescola.com/wp-content/uploads/2019/10/paisagem-ouro-preto-1008049370.jpg",
        contact_id: 1
      })
    
    Message.create!({
        origin_user_id: 1,
        destiny_user_id: 2,
        type_content_acronym_id: 52,
        content: "https://www.youtube.com/watch?v=tgbNymZ7vqY&feature=emb_logo",
        contact_id: 1
      })
  end
end
