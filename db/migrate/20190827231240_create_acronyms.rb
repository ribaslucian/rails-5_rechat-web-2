class CreateAcronyms < ActiveRecord::Migration[5.2]
  def change
    create_table :acronyms do |t|
      
      t.string  :name
      t.text    :description
      t.string  :data_refer, limit: 64

      t.timestamps
    end
  end
end
