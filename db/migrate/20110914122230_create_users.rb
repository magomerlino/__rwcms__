class CreateUsers < ActiveRecord::Migration
  def change
    create_table :user, {:primary_key => :oid} do |t|
      t.timestamps
      t.string :username, :null => false
      t.string :password, :null => false
      t.string :email, :null => false
      t.string :firstname
      t.string :lastname
      t.integer :avatar_oid
      t.integer :group_oid
      t.integer :clab_oid
      t.boolean :active, :null => false, :default => 1
    end
    add_index :user, :oid
    add_index :user, :username, :unique => true
  end
end
