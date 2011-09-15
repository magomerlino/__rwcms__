class CreateRegions < ActiveRecord::Migration
  def change
    create_table :region, {:primary_key => :oid} do |t|
      t.integer :status, :null => false, :limit => 3
      t.string :label, :null => false
      t.integer :application_oid, :null => false
    end
    add_index :region, :oid

    create_table :country_region, {:id => false} do |t|
      t.integer :country_isocode2, :null => false
      t.integer :region_oid, :null => false
    end
    add_index :country_region, [:country_isocode2, :region_oid], :unique => true
  end
end
