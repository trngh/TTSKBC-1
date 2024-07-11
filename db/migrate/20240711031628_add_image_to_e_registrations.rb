class AddImageToERegistrations < ActiveRecord::Migration[6.0]
  def change
    add_column :e_registrations, :image, :string
  end
end
