# migration_signature: ae1b44459206420c08ccaee0a00fc2ef

class RemoveUsersRefFromOrganisation < ActiveRecord::Migration[7.0]
  def change
    remove_reference :organisations, :user, null: false, foreign_key: true
  end
end
