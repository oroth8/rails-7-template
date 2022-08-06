# migration_signature: d061a85fe691d5fb3c3c69277604094e

class RenameTypeColOnEventTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :type, :date_type
  end
end
