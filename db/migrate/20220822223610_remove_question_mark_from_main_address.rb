# migration_signature: f0487a195eccd5b5e7cb2a88ae9f32f5

class RemoveQuestionMarkFromMainAddress < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :main_address?, :main_address
  end
end
