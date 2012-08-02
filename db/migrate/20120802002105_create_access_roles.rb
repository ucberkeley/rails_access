class CreateAccessRoles < ActiveRecord::Migration
  def change
    create_table :access_roles do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
