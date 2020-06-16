class Interaction < ApplicationRecord
  has_many :messages, -> { where('origin_user_id IS NULL AND destiny_user_id IS NULL') }, dependent: :destroy
  before_save :set_message_ids

  # belongs_to :type, -> { select :name }, class_name: 'Acronym', foreign_key: :type_acronym_id, optional: true
  
  accepts_nested_attributes_for :messages, allow_destroy: true  
  
  def set_message_ids
    i = 1
    self.messages.each do |m|
      if (m.type_acronym_id != 5)
        m.interaction_ids = i
        i = i + 1
      end
    end
  end
  
  def self.save_times params
    if params["scroll_count"] > 1
      # salvar o tempo de foco de todas as mensagens
      params['times'].each do |id, time|
        message = Message.find(id)
        message.time_focus = message.time_focus + time;
        message.count_views = message.count_views + 1;
        message.save!
      end
    else
      # salvar o tempo de foco apenas da ultima
      id = params['times'].keys.last
      message = Message.find(id)
      message.time_focus = message.time_focus + params['times'][id];
      message.count_views = message.count_views + 1;
      message.save!
    end
    
    params
  end
end
