class CreateAccessRoles < ActiveRecord::Migration
  def change
    create_table :access_roles do |t|
      t.string :key
      t.string :name
      t.string :description
    end
    add_index :access_roles, :name
  end
end
