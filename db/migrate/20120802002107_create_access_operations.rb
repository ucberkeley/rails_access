class CreateAccessOperations < ActiveRecord::Migration
  def change
    create_table :access_operations do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
