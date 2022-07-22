# migration_signature: f42378a2101890078afa36d088cb71cf

class CreateOrganisations < ActiveRecord::Migration[7.0]
  def change
    create_table :organisations do |t|
      t.string :name, null: false
      t.integer :capacity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
