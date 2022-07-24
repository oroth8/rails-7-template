# migration_signature: 0b8c23bbace5c4498f40cba73786290b

class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.integer :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
