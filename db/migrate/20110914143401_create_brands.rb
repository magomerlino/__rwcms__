class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brand, {:primary_key => :oid} do |t|
      t.string :name, :null => false
    end
    add_index :brand, :oid
    add_index :brand, :name, :unique => true
  end
end
