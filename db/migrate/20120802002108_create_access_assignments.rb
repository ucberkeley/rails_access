class CreateAccessAssignments < ActiveRecord::Migration
  def change
    create_table :access_assignments do |t|
      t.references :user
      t.references :role

      t.timestamps
    end
    add_index :access_assignments, :user_id
    add_index :access_assignments, :role_id
  end
end
