class AddUserToEJoins < ActiveRecord::Migration[6.0]
  def change
    add_reference :e_joins, :user, null: false, foreign_key: true
  end
end
