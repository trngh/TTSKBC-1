class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|

      t.string :name
      t.date :birthday
      t.integer :gender
      t.string :phone
      t.string :company
      t.integer :status, default: 1

      t.references :role, null: false, foreign_key: true
      t.timestamps
    end
  end
end
