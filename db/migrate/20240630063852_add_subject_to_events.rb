class AddSubjectToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :subject, null: false, foreign_key: true
  end
end
