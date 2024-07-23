class AddContentToERegistrations < ActiveRecord::Migration[6.0]
  def change
    add_column :e_registrations, :content, :text
  end
end
