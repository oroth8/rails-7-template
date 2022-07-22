# migration_signature: 954ffcd0453f82587ec76d488e70bb4f

class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.string :name
      t.string :number, null: false
      t.references :organisation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
