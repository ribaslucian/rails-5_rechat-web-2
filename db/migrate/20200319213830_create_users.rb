class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      
      t.string :entity_name, null: false
      t.string :name, null: false, index: {unique: true}
      t.string :password, null: false
      t.integer :type_acronym_id, foreign_key: {to_table: :acronyms, name: 'rule_fk:users.type'}, null: false
      
      t.integer :answer_1_acronym_id, foreign_key: {to_table: :acronyms, name: 'rule_fk:users.answer_1'}
      t.integer :answer_2_acronym_id, foreign_key: {to_table: :acronyms, name: 'rule_fk:users.answer_2'}
      t.integer :answer_3_acronym_id, foreign_key: {to_table: :acronyms, name: 'rule_fk:users.answer_3'}
      
      t.timestamps
    end
  end
end
