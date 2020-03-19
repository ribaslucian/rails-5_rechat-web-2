class AddRoomToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :room, :string
  end
end
