class AddTimeendToERegistrations < ActiveRecord::Migration[6.0]
  def change
    add_column :e_registrations, :timeend, :datetime
  end
end
