class AddSubjectToERegistrations < ActiveRecord::Migration[6.0]
  def change
    add_reference :e_registrations, :subject, null: false, foreign_key: true
  end
end
