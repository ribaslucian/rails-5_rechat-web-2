class User < ApplicationRecord
   validates :entity_name, presence: true
   validates :name, presence: true
   validates :password, presence: true
   validates :type_acronym_id, presence: true
end
