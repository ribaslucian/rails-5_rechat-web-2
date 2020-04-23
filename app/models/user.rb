class User < ApplicationRecord
  has_many :contacts, dependent: :destroy
  
  before_create :add_defaults_contacts
  before_update :at_least_one_contact
  
  accepts_nested_attributes_for :contacts, allow_destroy: true
  
  def add_defaults_contacts
    if self.contacts.size == 0 && self.type_acronym_id == 201
      self.contacts = [
        Contact.new({
          name: "Pai",
          type_acronym_id: 600,
        }),
        Contact.new({
          name: "Mãe",
          type_acronym_id: 600,
        }),
        Contact.new({
          name: "Amigo",
          type_acronym_id: 601,
        }),
        Contact.new({
          name: "Chefe",
          type_acronym_id: 602,
        }),
        Contact.new({
          name: "Grupo do Trabalho",
          type_acronym_id: 603,
        }),
      ]
    end
  end
  
  # garantir que usuario voluntario se tenha ao menos 1 contato cadastrado
  def at_least_one_contact
    if self.type_acronym_id == 201
      # comparar quantidade antes da edição e depois da edição
    end
  end
  
end
