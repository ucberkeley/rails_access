class CreateAccessPermissions < ActiveRecord::Migration
  def change
    create_table :access_permissions do |t|
      t.references :role
      t.references :operation
    end
    add_index :access_permissions, :role_id
    add_index :access_permissions, :operation_id
  end
end
