class CreateERegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :e_registrations do |t|

      t.string :title
      t.date :timestart
      t.string :detail
      t.integer :slot
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
