class ChangeTimestartToDatetimeInERegistrations < ActiveRecord::Migration[6.0]
  def change
    change_column :e_registrations, :timestart, :datetime
  end
end
