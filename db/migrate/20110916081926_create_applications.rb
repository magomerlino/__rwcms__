class CreateApplications < ActiveRecord::Migration
  def change
    create_table :application, {:primary_key => :oid} do |t|
      t.timestamps
      t.integer :status, :null => false, :limit => 3
      t.string :label, :null => false
    end
    add_index :application, :oid
  end
end
