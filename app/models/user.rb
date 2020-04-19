class User < ApplicationRecord
  has_many :contacts, dependent: :destroy
  
  validates :name, presence: true
  validates :type_acronym_id, presence: true
  
  accepts_nested_attributes_for :contacts, allow_destroy: true  
end
