class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      
      # datos basicos de mensagens
      t.text :content, null: false
      t.timestamp :date, null: false
      
      ## mensagems de interacoes
      # para criacao de interacoes
      t.integer :sequence
      t.belongs_to :interaction
      t.integer :type_acronym_id, foreign_key: {to_table: :acronyms, name: 'rule_fk:messages.type_acronym'}
      t.json :sent_users_id       # usuarios que mensagem da interacao ja foi enviada
      t.json :answered_user_id    # usuarios que responderam essa mensagem de interacao
      
      ## mensagens de chats
      # saber quem enviou e quem respondeu
      t.integer :sent_user_id,      foreign_key: {to_table: :users,    name: 'rule_fk:messages.send_user'}
      t.integer :received_user_id,  foreign_key: {to_table: :users,    name: 'rule_fk:messages.received_user'}
      t.integer :father_message_id, foreign_key: {to_table: :messages, name: 'rule_fk:messages.father_message'}

      t.timestamps
    end
  end
end
