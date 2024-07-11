class ChangeTimestartToDatetimeInEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :timestart, :datetime
  end
end
