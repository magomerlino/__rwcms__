class CreateGroups < ActiveRecord::Migration
  def change
    create_table :group, {:primary_key => :oid} do |t|

      t.timestamps
      t.string :groupname
      t.integer :module_oid, :null => false
      t.integer :visibilityoid, :null => false
    end
    add_index :group, :oid
    
    create_table :group_clab, {:id => false} do |t|
      t.integer :group_oid, :null => false
      t.integer :clab_oid, :null => false
    end
    add_index :group_clab, [:group_oid, :clab_oid], :unique => true
      
    create_table :user_group, {:id => false} do |t|
      t.integer :user_oid, :null => false
      t.integer :group_oid, :null => false
    end
    add_index :user_group, [:user_oid, :group_oid], :unique => true  
      
  end
end
