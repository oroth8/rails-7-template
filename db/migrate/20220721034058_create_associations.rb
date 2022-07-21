# migration_signature: 05eae035d7773ae93e89d6229435934c

class CreateAssociations < ActiveRecord::Migration[7.0]
  def change
    create_table :associations do |t|
      t.string :name
      t.integer :capacity

      t.timestamps
    end
  end
end
