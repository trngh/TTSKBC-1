class AddTimeendToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :timeend, :datetime
  end
end
