# migration_signature: 6b51d4eb39acb2458a673529a709373c

class AddRepeatingColToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :repeating, :boolean, default: false
  end
end
