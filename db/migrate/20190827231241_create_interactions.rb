class CreateInteractions < ActiveRecord::Migration[5.2]
  def change
    create_table :interactions do |t|
      
      t.string :name, null: false
      t.json :user_sends

      t.timestamps
    end
  end
end
