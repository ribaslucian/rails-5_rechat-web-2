class CreateInteractions < ActiveRecord::Migration[5.2]
  def change
    create_table :interactions do |t|
      
      t.string :name, null: false
      t.json :user_sends
      
      t.integer :type_acronym_id, foreign_key: {to_table: :acronyms, name: 'rule_fk:interactions.type'}, null: false
      t.integer :schedule_acronym_id, foreign_key: {to_table: :acronyms, name: 'rule_fk:interactions.schedule'}, null: false
      t.integer :number_schedule_acronym_id, foreign_key: {to_table: :acronyms, name: 'rule_fk:interactions.number_schedule'}, null: false

      t.timestamps
    end
  end
end
