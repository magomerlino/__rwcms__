class CreateClabs < ActiveRecord::Migration
  def change
    create_table :clab, {:primary_key => :oid} do |t|
      t.timestamps
      t.integer :status, :null => false, :limit => 3
      t.string :label
      t.integer :brand_oid, :null => false
      t.integer :application_oid, :null => false
      t.string :country_isocode2, :null => false, :limit => 2
      t.string :language_isocode2, :null => false, :limit => 2
      t.string :basicurl
      t.string :applicationname
    end
    add_index :clab, :oid
    add_index :clab, [:brand_oid, :application_oid, :country_isocode2, :language_isocode2], :name => 'index_clab_bacl', :unique => true
  end
end
