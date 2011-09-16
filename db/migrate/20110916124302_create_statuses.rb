class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :status, {:primary_key => :oid} do |t|
      t.string :label, :null => false
    end
    add_index :status, :oid
  end
end
