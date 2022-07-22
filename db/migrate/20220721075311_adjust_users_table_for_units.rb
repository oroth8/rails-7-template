# migration_signature: efad81be4996b03afaa08f95cbc71dd3

class AdjustUsersTableForUnits < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :unit

    add_reference :users, :unit, index: true, foreign_key: true 
  end
end
