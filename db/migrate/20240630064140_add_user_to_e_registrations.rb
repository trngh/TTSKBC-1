class AddUserToERegistrations < ActiveRecord::Migration[6.0]
  def change
    add_reference :e_registrations, :user, null: false, foreign_key: true
  end
end
