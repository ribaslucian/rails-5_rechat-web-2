class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|

      # datos basicos de mensagens
      t.text :content
      t.timestamp :date_send, default: -> { 'CURRENT_TIMESTAMP' }, null: false

      ## mensagems de interacoes
      # para criacao de interacoes
      # t.integer :sequence
      t.belongs_to :interaction, foreign_key: true
      t.integer :type_acronym_id, foreign_key: {to_table: :acronyms, name: 'rule_fk:messages.type_acronym'}
      t.json :sent_users_id       # usuarios que mensagem da interacao ja foi enviada
      t.json :answered_users_id    # usuarios que responderam essa mensagem de interacao

      # para mensagens multi-midia
      t.integer :type_content_acronym_id, foreign_key: {to_table: :acronyms, name: 'rule_fk:messages.:type_content'}, default: 50
      t.string :url

      ## mensagens de chats
      # saber quem enviou e quem respondeu
      t.integer :origin_user_id, foreign_key: {to_table: :users, name: 'rule_fk:messages.origin_user'}
      t.integer :destiny_user_id, foreign_key: {to_table: :users, name: 'rule_fk:messages.destiny_user'}
      t.integer :previous_message_id, foreign_key: {to_table: :messages, name: 'rule_fk:messages.previous_message'}
      
      t.integer :contact_id, foreign_key: {to_table: :contacts, name: 'rule_fk:messages.contact'}
      
      # calculos emocionais
      t.text :content_en
      t.string :sentimental_category
      t.decimal :sentimental_score
      
      # controle de notificações
      t.boolean :received, default: false
      t.boolean :viewed, default: false

      t.timestamps
    end
  end
end
