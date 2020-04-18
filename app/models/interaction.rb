class Interaction < ApplicationRecord
  has_many :messages
  
  # belongs_to :type, -> { select :name }, class_name: 'Acronym', foreign_key: :type_acronym_id, optional: true
  
  
  accepts_nested_attributes_for :messages, allow_destroy: true
  
end
