class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      
      t.integer :sequence
      t.string :type
      t.text :content
      t.timestamp :date
      
      t.belongs_to :interaction

      t.timestamps
    end
  end
end
