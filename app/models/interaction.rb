class Interaction < ApplicationRecord
  has_many :messages, dependent: :destroy
  before_save :set_message_ids

  # belongs_to :type, -> { select :name }, class_name: 'Acronym', foreign_key: :type_acronym_id, optional: true
  
  accepts_nested_attributes_for :messages, allow_destroy: true  
  
  def set_message_ids
    i = 1
    self.messages.each do |m|
      m.interaction_ids = i
      i = i + 1
    end
  end
end
