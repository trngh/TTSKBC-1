class AddRoomToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :room, null: false, foreign_key: true
  end
end
