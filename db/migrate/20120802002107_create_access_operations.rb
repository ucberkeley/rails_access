class CreateAccessOperations < ActiveRecord::Migration
  def change
    create_table :access_operations do |t|
      t.string :key
      t.string :name
      t.string :description
    end
    add_index :access_operations, :name
  end
end
