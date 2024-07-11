class AddRoomIdToERegistrations < ActiveRecord::Migration[6.0]
  def change
    add_column :e_registrations, :room_id, :integer
  end
end
