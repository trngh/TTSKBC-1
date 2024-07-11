class CreateEJoins < ActiveRecord::Migration[6.0]
  def change
    create_table :e_joins do |t|

      t.timestamps
    end
  end
end
