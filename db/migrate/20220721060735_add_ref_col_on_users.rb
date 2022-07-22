# migration_signature: 70bd0347f858c5189dac1b2b6877e7ca

class AddRefColOnUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :organisation, null: false, foreign_key: true
  end
end
